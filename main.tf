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

  depends_on = [
    docker_volume.prometheus_data,
    local_file.prometheus_config
  ]

  destroy_grace_seconds = 10
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

  depends_on = [
    docker_volume.grafana_data,
    docker_container.prometheus,
    local_file.grafana_config,
    local_file.dashboard_config,
    local_file.node_exporter_dashboard,
    local_file.grafana_datasource
  ]

  destroy_grace_seconds = 10
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
}

resource "local_file" "prometheus_config" {
  content = templatefile("${path.module}/config/prometheus.yml.tpl", {
    prometheus_port    = var.prometheus_port
    node_exporter_port = var.node_exporter_port
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
  count = length([
    docker_container.prometheus.id,
    docker_container.grafana.id,
    docker_container.node_exporter.id
  ])

  depends_on = [
    docker_container.prometheus,
    docker_container.grafana,
    docker_container.node_exporter
  ]

  provisioner "local-exec" {
    command = "sleep 10"
  }
}
