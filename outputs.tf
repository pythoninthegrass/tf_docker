# Prometheus outputs
output "prometheus_url" {
  description = "URL to access Prometheus UI"
  value       = "http://localhost:${var.prometheus_port}"
}

output "prometheus_container_id" {
  description = "ID of the Prometheus container"
  value       = docker_container.prometheus.id
}

# Grafana outputs
output "grafana_url" {
  description = "URL to access Grafana UI"
  value       = "http://localhost:${var.grafana_port}"
}

output "grafana_container_id" {
  description = "ID of the Grafana container"
  value       = docker_container.grafana.id
}

output "grafana_credentials" {
  description = "Grafana login credentials"
  value = {
    username = var.grafana_admin_user
    password = nonsensitive(var.grafana_admin_password) # Mark as non-sensitive for output
  }
  sensitive = true
}

# Node Exporter outputs
output "local_node_exporter" {
  description = "Local node-exporter details"
  value = {
    url          = "http://localhost:${var.node_exporter_port}/metrics"
    container_id = docker_container.node_exporter.id
    network      = docker_network.promgraf_network.name
  }
}

output "remote_node_exporters" {
  description = "Remote node-exporter details"
  value = {
    for host in var.node_exporter_hosts : host.name => {
      url      = "http://${host.ip}:${var.node_exporter_port}/metrics"
      host     = host.ip
      ssh_user = host.ssh_user
    }
  }
}

# Network info
output "monitoring_network" {
  description = "Docker network details"
  value = {
    name = docker_network.promgraf_network.name
    id   = docker_network.promgraf_network.id
  }
}

# Configuration files
output "config_files" {
  description = "Paths to important configuration files"
  value = {
    prometheus_config = local_file.prometheus_config.filename
    grafana_config    = local_file.grafana_config.filename
    dashboards_path   = "${path.module}/config/grafana/dashboards"
    datasources_path  = "${path.module}/config/grafana/provisioning/datasources"
  }
}
