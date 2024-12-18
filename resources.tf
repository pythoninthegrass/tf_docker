resource "docker_network" "promgraf_network" {
  name = "promgraf-net"
}

resource "docker_volume" "prometheus_data" {
  name   = "prometheus-data"
  driver = "local"
  driver_opts = {
    type   = "none"
    device = "${abspath(path.cwd)}/data/prometheus"
    o      = "bind"
  }

  lifecycle {
    prevent_destroy = false
  }
}

resource "docker_volume" "grafana_data" {
  name   = "grafana-data"
  driver = "local"
  driver_opts = {
    type   = "none"
    device = "${abspath(path.cwd)}/data/grafana"
    o      = "bind"
  }

  lifecycle {
    prevent_destroy = false
  }
}

resource "docker_image" "prometheus" {
  name = "prom/prometheus:latest"
}

resource "docker_image" "grafana" {
  name = "grafana/grafana:latest"
}

resource "docker_image" "node_exporter" {
  name         = "prom/node-exporter:latest"
  keep_locally = true
}

