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
    host_path      = "${path.module}/prometheus.yml"
    container_path = "/etc/prometheus/prometheus.yml"
  }

  command = ["--config.file=/etc/prometheus/prometheus.yml"]

  networks_advanced {
    name = docker_network.promgraf_network.name
  }
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
    host_path      = "${path.module}/grafana-config.ini"
    container_path = "/etc/grafana/config.ini"
  }

  networks_advanced {
    name = docker_network.promgraf_network.name
  }

  depends_on = [docker_container.prometheus]
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
  content = templatefile("${path.module}/prometheus.yml.tpl", {
    prometheus_port    = var.prometheus_port
    node_exporter_port = var.node_exporter_port
  })
  filename = "${path.module}/prometheus.yml"
}

resource "local_file" "grafana_config" {
  content = templatefile("${path.module}/grafana-config.ini.tpl", {
    grafana_port          = var.grafana_port
    grafana_admin_user    = var.grafana_admin_user
    grafana_admin_password = var.grafana_admin_password
  })
  filename = "${path.module}/grafana-config.ini"
}
