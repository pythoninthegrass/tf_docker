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

variable "node_exporter_hosts" {
  description = "List of hosts for node-exporter deployment"
  type = list(object({
    name     = string
    ip       = string
    ssh_user = string
    ssh_port = number
  }))
}

variable "service_hosts" {
  description = "List of service hosts to monitor"
  type = list(object({
    service  = string
    name     = string
    ip       = string
    port     = number
    ssh_user = string
    ssh_port = number
  }))
  default = []
}

variable "playbook" {
  description = "The Ansible playbook to run"
  type        = string
}

variable "ssh_private_key_path" {
  description = "Path to SSH private key for Ansible"
  type        = string
}
