terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

# localhost
provider "docker" {
  host = "unix:///var/run/docker.sock"
  registry_auth {
    address     = "https://index.docker.io/v1/"
    config_file = pathexpand("~/.docker/config.json")
  }
  registry_auth {
    address     = "ghcr.io"
    config_file = pathexpand("~/.docker/config.json")
  }
}

# remote host
# provider "docker" {
#   host     = "ssh://user@remote-host:22"
#   ssh_opts = ["-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null"]
# }

# resource "docker_image" "ubuntu" {
#   name = "ubuntu:latest"
# }

# resource "docker_container" "ubuntu_tf" {
#   image = docker_image.ubuntu.image_id
#   name  = "ubuntu-tf"
#   command = [ "sleep", "infinity" ]
# }

resource "docker_network" "promgraf_network" {
  name = "promgraf-net"
}

resource "docker_volume" "prometheus_data" {
  name = "prometheus-data"
}

resource "docker_volume" "grafana_data" {
  name = "grafana-data"
}

resource "docker_image" "prometheus" {
  name = "prom/prometheus:latest"
}

resource "docker_image" "grafana" {
  name = "grafana/grafana:latest"
}

resource "docker_image" "node_exporter" {
  name = "prom/node-exporter:latest"
}
