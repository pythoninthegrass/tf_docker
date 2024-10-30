global:
  scrape_interval: 15s

scrape_configs:
  - job_name: 'prometheus'
    static_configs:
      - targets: ['localhost:${prometheus_port}']

  - job_name: 'node'
    static_configs:
      - targets: [
          'node-exporter:${node_exporter_port}',
          %{~ for host in node_exporter_hosts ~}
          '${host.ip}:${node_exporter_port}',
          %{~ endfor ~}
        ]
