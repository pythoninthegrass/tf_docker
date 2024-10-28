[node_exporters]
%{ for host in node_exporter_hosts ~}
${host.name} ansible_host=${host.ip} ansible_user=${host.ssh_user} ansible_port=${host.ssh_port}
%{ endfor ~}

[all:vars]
node_exporter_port=${node_exporter_port}
ansible_ssh_private_key_file=${ssh_private_key_path}
