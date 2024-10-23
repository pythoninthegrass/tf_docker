resource "ansible_group" "node_exporters" {
  name = "node_exporters"
  variables = {
    node_exporter_port  = var.node_exporter_port
    node_exporter_image = docker_image.node_exporter.name
  }
}

resource "local_file" "ansible_inventory" {
  filename = "${path.module}/hosts"
  content  = "placeholder"
}

resource "ansible_host" "node_exporter_hosts" {
  for_each = { for host in var.node_exporter_hosts : host.name => host }

  name   = each.value.name
  groups = [ansible_group.node_exporters.name]

  variables = {
    ansible_host                 = each.value.ip
    ansible_user                 = each.value.ssh_user
    ansible_port                 = each.value.ssh_port
    ansible_ssh_private_key_file = var.ssh_private_key_path
  }
}

resource "local_file" "node_exporter_playbook" {
  filename = "${path.module}/playbooks/node_exporter.yml"
  content  = <<-EOF
    ---
    - hosts: node_exporters
      become: true
      tasks:
        - name: Pull node-exporter image
          docker_image:
            name: "{{ node_exporter_image }}"
            source: pull
            force_source: yes

        - name: Run node-exporter container
          docker_container:
            name: node-exporter
            image: "{{ node_exporter_image }}"
            state: started
            restart_policy: unless-stopped
            ports:
              - "{{ node_exporter_port }}:9100"
            destroy_grace_seconds: 10
            restart: yes
            force_kill: yes
            recreate: yes
  EOF
}

resource "null_resource" "run_ansible" {
  depends_on = [
    local_file.node_exporter_playbook,
    ansible_host.node_exporter_hosts,
    ansible_group.node_exporters,
    local_file.ansible_inventory
  ]

  provisioner "local-exec" {
    command = "ansible-playbook -i ${path.module}/ansible_inventory ${path.module}/playbooks/node_exporter.yml"

    environment = {
      ANSIBLE_HOST_KEY_CHECKING = "False"
    }
  }

  triggers = {
    playbook_hash = local_file.node_exporter_playbook.content
    hosts_hash    = jsonencode(ansible_host.node_exporter_hosts)
    image_hash    = docker_image.node_exporter.repo_digest
  }
}
