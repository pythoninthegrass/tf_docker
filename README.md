# tf_docker

Spin up Docker containers using Terraform.

## Development

### Dependencies

This project can install most dependencies automatically using a package manager, so please make sure they are installed.

* Windows: [Chocolatey](https://chocolatey.org/)
* MacOS: [Homebrew](https://brew.sh/)

Now run `make install` and most tools will be installed for you.

> [!WARNING]
> [pre-commit](https://pre-commit.com/#install) and [Checkov](https://www.checkov.io/2.Basics/Installing%20Checkov.html) need to be installed manually on Windows.

### Pre Commit

The Pre-Commit framework is used to manage and install pre-commit hooks on your local machine. After cloning this repository you can run `make precommit_install` to initialize the hooks. This only needs to be done once after cloning.

### Running Chores

The `make chores` command will automatically update documentation using Terraform-Docs, and will run automatic formatting.

### Security Checks

This project uses Trivy and Checkov for security scanning. You can run `make test_security` to run both tools, while `make test_trivy` and `make test_checkov` run each component on its own.

### Linting

To run TFLint use the command `make test_tflint`.

It is possible to automatically apply some fixes, but these should be reviewed before running. If you are comfortable with all of the results from `make test_tflint` being fixed automatically then run `make fix_tflint`.

## TODO

* Add [restart: unless-stopped](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/container#restart) to all containers
* Use [remote hosts](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs#remote-hosts) specifically for exporters
  * node-exporter
  * nodejs
  * mongodb
  * elasticsearch
  * redis

## Further Reading

* [Docs overview | kreuzwerker/docker | Terraform | Terraform Registry](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs) 
* [Using Terraform to Set Up and Deploy Docker Containers](https://spacelift.io/blog/terraform-docker)
* [sajosam/host-monitoring](https://github.com/sajosam/host-monitoring)
