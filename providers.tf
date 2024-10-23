terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
    ansible = {
      source  = "ansible/ansible"
      version = "~> 1.3.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
  registry_auth {
    address     = "https://index.docker.io/v1/"
    config_file = pathexpand("~/.docker/config.json")
  }
}

provider "ansible" {}
