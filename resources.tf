resource "docker_network" "promgraf_network" {
  name = "promgraf-net"
}

resource "docker_volume" "prometheus_data" {
  name   = "prometheus-data"
  driver = "local"
}

resource "docker_volume" "grafana_data" {
  name   = "grafana-data"
  driver = "local"
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

