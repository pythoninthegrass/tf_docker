resource "docker_container" "prometheus" {
  name  = "prometheus"
  image = docker_image.prometheus.image_id

  ports {
    internal = 9090
    external = var.prometheus_port
  }

  volumes {
    volume_name    = docker_volume.prometheus_data.name
    container_path = "/prometheus"
  }

  volumes {
    host_path      = abspath("${path.module}/config/prometheus.yml")
    container_path = "/etc/prometheus/prometheus.yml"
    read_only      = true
  }

  command = [
    "--config.file=/etc/prometheus/prometheus.yml",
    "--storage.tsdb.path=/prometheus",
    "--web.console.libraries=/etc/prometheus/console_libraries",
    "--web.console.templates=/etc/prometheus/consoles",
    "--web.enable-lifecycle"
  ]

  networks_advanced {
    name = docker_network.promgraf_network.name
  }

  restart = "unless-stopped"

  destroy_grace_seconds = 10

  depends_on = [
    docker_volume.prometheus_data,
    local_file.prometheus_config
  ]
}

resource "docker_container" "grafana" {
  name  = "grafana"
  image = docker_image.grafana.image_id

  ports {
    internal = 3000
    external = var.grafana_port
  }

  env = [
    "GF_SECURITY_ADMIN_USER=${var.grafana_admin_user}",
    "GF_SECURITY_ADMIN_PASSWORD=${var.grafana_admin_password}"
  ]

  volumes {
    volume_name    = docker_volume.grafana_data.name
    container_path = "/var/lib/grafana"
  }

  volumes {
    host_path      = abspath("${path.module}/config/grafana-config.ini")
    container_path = "/etc/grafana/config.ini"
    read_only      = true
  }

  volumes {
    host_path      = abspath("${path.module}/config/grafana/dashboards")
    container_path = "/etc/grafana/provisioning/dashboards"
    read_only      = true
  }

  volumes {
    host_path      = abspath("${path.module}/config/grafana/provisioning/datasources")
    container_path = "/etc/grafana/provisioning/datasources"
    read_only      = true
  }

  networks_advanced {
    name = docker_network.promgraf_network.name
  }
  restart = "unless-stopped"

  destroy_grace_seconds = 10

  depends_on = [
    docker_volume.grafana_data,
    docker_container.prometheus,
    local_file.grafana_config,
    local_file.dashboard_config,
    local_file.node_exporter_dashboard,
    local_file.grafana_datasource
  ]
}

resource "local_file" "grafana_datasource" {
  content  = templatefile("${path.module}/config/grafana/provisioning/datasources/prometheus.yml.tpl", {})
  filename = "${path.module}/config/grafana/provisioning/datasources/prometheus.yml"
}

resource "docker_container" "node_exporter" {
  name  = "node-exporter"
  image = docker_image.node_exporter.image_id

  ports {
    internal = 9100
    external = var.node_exporter_port
  }

  networks_advanced {
    name = docker_network.promgraf_network.name
  }

  restart = "unless-stopped"

  destroy_grace_seconds = 10
}

resource "local_file" "prometheus_config" {
  content = templatefile("${path.module}/config/prometheus.yml.tpl", {
    prometheus_port     = var.prometheus_port
    node_exporter_port  = var.node_exporter_port
    node_exporter_hosts = var.node_exporter_hosts
  })
  filename = "${path.module}/config/prometheus.yml"
}

resource "local_file" "grafana_config" {
  content = templatefile("${path.module}/config/grafana-config.ini.tpl", {
    grafana_port           = var.grafana_port
    grafana_admin_user     = var.grafana_admin_user
    grafana_admin_password = var.grafana_admin_password
  })
  filename = "${path.module}/config/grafana-config.ini"
}

resource "local_file" "dashboard_config" {
  content  = templatefile("${path.module}/config/grafana/dashboards/dashboard.yml.tpl", {})
  filename = "${path.module}/config/grafana/dashboards/dashboard.yml"
}

resource "local_file" "node_exporter_dashboard" {
  content = templatefile("${path.module}/config/grafana/dashboards/node-exporter.json.tpl", {
    node_exporter_port = var.node_exporter_port
    datasource         = var.grafana_datasource_name
  })
  filename = "${path.module}/config/grafana/dashboards/node-exporter.json"
}

resource "null_resource" "wait_for_containers" {
  count = 1

  depends_on = [
    docker_container.prometheus,
    docker_container.grafana,
    docker_container.node_exporter
  ]

  provisioner "local-exec" {
    command = "sleep 10"
  }
}

resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/hosts.tpl", {
    node_exporter_hosts  = var.node_exporter_hosts
    node_exporter_port   = var.node_exporter_port
    ssh_private_key_path = pathexpand(var.ssh_private_key_path)
  })
  filename = "${path.module}/hosts"
}

resource "null_resource" "ansible_playbook" {
  depends_on = [local_file.ansible_inventory]

  triggers = {
    inventory_content = local_file.ansible_inventory.content
    playbook_hash     = filemd5("${path.module}/node_exporter.yml")
  }

  provisioner "local-exec" {
    command = "ansible-playbook -i ${local_file.ansible_inventory.filename} node_exporter.yml"
  }
}
