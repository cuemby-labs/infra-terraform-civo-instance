# Civo Compute Instance Template

Terraform module which deploys Compute Instance on CIVO provider.

## Usage

```hcl
module "civo_compute_instance" {
  source = "./path_to_your_module"

  # Variables for Civo compute instance
  instance_hostname = "example-instance"
  instance_size     = "g3.small"
  instance_notes    = "This is a test instance"
  region            = "NYC1"
  ssh_public_key    = "ssh-rsa abnsfkjanbkjexample"
  disk_image_name   = "ubuntu-22"
  instance_tags     = ["tag1", "tag2"]
  script            = file("path_to_startup_script.sh")

  # Variables for Civo network
  network_cidr_v4        = "192.168.10.0/24"
  network_nameservers_v4 = ["8.8.8.8", "1.1.1.1"]

  # Variables for Civo firewall
  external_network = ["0.0.0.0/0"]
  default_cidr     = ["0.0.0.0/0"]
  local_cidr       = ["192.168.10.0/24"]
}

```

## Examples

- ...
- ...

## Contributing

Please read our [contributing guide](./docs/CONTRIBUTING.md) if you're interested in contributing to Walrus template.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.7 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_civo"></a> [civo](#provider\_civo) | >= 1.0.49 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [civo_kubernetes_cluster.my-cluster](https://registry.terraform.io/providers/civo/civo/latest/docs/resources/kubernetes_cluster) | resource |
| [civo_network.custom_net](https://registry.terraform.io/providers/civo/civo/latest/docs/resources/network) | resource |
| [civo_firewall.custom_rule](https://registry.terraform.io/providers/civo/civo/latest/docs/resources/firewall) | resource |
| [civo_ssh_key.example](https://registry.terraform.io/providers/civo/civo/latest/docs/data-sources/ssh_key) | resource |
| [disk_image.os](https://registry.terraform.io/providers/civo/civo/latest/docs/data-sources/disk_image) | resource |
| [civo_instance.example](https://registry.terraform.io/providers/civo/civo/latest/docs/resources/instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_instance_hostname"></a> [instance_hostname](#input\_instance_hostname) | Hostname for the Civo compute instance. | `string` | `"NYC1"` | no |
| <a name="input_instance_size"></a> [instance_size](#input\_instance_size) | Civo compute instance size. | `string` | `"g3.xsmall"` | no |
| <a name="input_instance_notes"></a> [instance_notes](#input\_instance_notes) | Civo compute instance notes. | `string` | `"This is an example instance"` | no |
| <a name="input_region"></a> [region](#input\_region) | Civo region to deploy the cluster. | `string` | `"NYC1"` | no |
| <a name="input_ssh_public_key"></a> [ssh_public_key](#input\_ssh_public_key) | The public SSH key to be used for Civo instance. | `string` | n/a | yes |
| <a name="input_disk_image_name"></a> [disk_image_name](#input\_disk_image_name) | The name of the disk image to filter by (e.g., debian-10, ubuntu-22). | `string` | `"ubuntu-22"` | no |
| <a name="input_instance_tags"></a> [instance_tags](#input\_instance_tags) | List for instance tags. | `list(string)` | `null` | no |
| <a name="input_script"></a> [script](#input\_script) | Script for the Compute Instance. | `string` | `null` | no |
| <a name="input_network_cidr_v4"></a> [network_cidr_v4](#input\_network_cidr_v4) | CIDR block for the network. | `string` | `"192.168.0.0/24"` | no |
| <a name="input_network_nameservers_v4"></a> [network_nameservers_v4](#input\_network_nameservers_v4) | List of nameservers for the network. | `list(string)` | `["8.8.8.8", "1.1.1.1"]` | no |
| <a name="input_external_network"></a> [external_network](#input\_external_network) | External CIDR for kubectl access. | `list(string)` | `["0.0.0.0/0"]` | no |
| <a name="input_default_cidr"></a> [default_cidr](#input\_default_cidr) | Default CIDR 0.0.0.0/0. | `list(string)` | `["0.0.0.0/0"]` | no |
| <a name="input_local_cidr"></a> [local_cidr](#input\_local_cidr) | Local CIDR for ingress firewall rules. | `list(string)` | `["192.168.0.0/24"]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_walrus_environment_id"></a> [walrus\_environment\_id](#output\_walrus\_environment\_id) | The id of environment where deployed in Walrus. |
| <a name="output_walrus_environment_name"></a> [walrus\_environment\_name](#output\_walrus\_environment\_name) | The name of environment where deployed in Walrus. |
| <a name="output_walrus_project_id"></a> [walrus\_project\_id](#output\_walrus\_project\_id) | The id of project where deployed in Walrus. |
| <a name="output_walrus_project_name"></a> [walrus\_project\_name](#output\_walrus\_project\_name) | The name of project where deployed in Walrus. |
| <a name="output_walrus_resource_id"></a> [walrus\_resource\_id](#output\_walrus\_resource\_id) | The id of resource where deployed in Walrus. |
| <a name="output_walrus_resource_name"></a> [walrus\_resource\_name](#output\_walrus\_resource\_name) | The name of resource where deployed in Walrus. |
<!-- END_TF_DOCS -->

## License

Copyright (c) 2023 [Seal, Inc.](https://seal.io)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at [LICENSE](./LICENSE) file for details.

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
