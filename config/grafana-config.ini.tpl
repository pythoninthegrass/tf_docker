[server]
protocol = http
http_port = ${grafana_port}

[security]
admin_user = ${grafana_admin_user}
admin_password = ${grafana_admin_password}

[users]
allow_sign_up = false
