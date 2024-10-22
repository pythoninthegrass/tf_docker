variable "prometheus_port" {
  description = "The port to expose Prometheus on"
  default     = 9090
}

variable "grafana_port" {
  description = "The port to expose Grafana on"
  default     = 3000
}

variable "node_exporter_port" {
  description = "The port to expose Node Exporter on"
  default     = 9100
}

variable "grafana_admin_user" {
  description = "The Grafana admin username"
  default     = "admin"
}

variable "grafana_admin_password" {
  description = "The Grafana admin password"
  sensitive   = true
}

variable "grafana_datasource_name" {
  description = "Name of the Prometheus datasource in Grafana"
  type        = string
  default     = "Prometheus"
}
