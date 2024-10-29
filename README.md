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
| <a name="input_disk_image_name"></a> [disk_image_name](#input\_disk_image_name) | The name of the disk image to filter by, e.g. debian-11, ubuntu-jammy, run 'civo diskimage ls' to get the list. | `string` | `"ubuntu-22"` | no |
| <a name="input_instance_tags"></a> [instance_tags](#input\_instance_tags) | List for instance tags. | `list(string)` | `null` | no |
| <a name="input_script"></a> [script](#input\_script) | Script for the Compute Instance. | `string` | `null` | no |
| <a name="input_network_cidr_v4"></a> [network_cidr_v4](#input\_network_cidr_v4) | CIDR block for the network. | `string` | `"192.168.0.0/24"` | no |
| <a name="input_network_nameservers_v4"></a> [network_nameservers_v4](#input\_network_nameservers_v4) | List of nameservers for the network. | `list(string)` | `["8.8.8.8", "1.1.1.1"]` | no |
| <a name="input_external_network"></a> [external_network](#input\_external_network) | External CIDR for kubectl access. | `list(string)` | `["0.0.0.0/0"]` | no |
| <a name="input_default_cidr"></a> [default_cidr](#input\_default_cidr) | Default CIDR 0.0.0.0/0. | `list(string)` | `["0.0.0.0/0"]` | no |
| <a name="input_local_cidr"></a> [local_cidr](#input\_local_cidr) | Local CIDR for ingress firewall rules. | `list(string)` | `["192.168.0.0/24"]` | no |

Posibles inputs for disk images according to the civo list after running 'civo diskimage ls'

| ID                                   | Name         | Version | State     | Distribution |
|--------------------------------------|--------------|---------|-----------|--------------|
| cddce6c9-f84e-4e4f-ab8d-7a33cab85158 | debian-9     |       9 | available | debian       |
| 8eb48e20-e5db-49fe-9cdf-cc8f381c61c6 | ubuntu-focal |   20.04 | available | ubuntu       |
| 9f953761-8b20-4623-8dff-e0c845201966 | ubuntu-jammy |   22.04 | available | ubuntu       |
| f398bcd6-c27e-4d56-a6df-d5aa63bb4083 | debian-11    |      11 | available | debian       |
| 4a7b536b-c893-41cf-b5e1-19f47933267d | rocky-9-1    |     9.1 | available | rocky        |
| 7bb21130-840a-484f-a049-dcbbb4fd87cf | talos-v1.2.8 | 1.25.5  | available | talos        |
| 4204229c-510c-4ba4-ab07-522e2aaa2cf8 | debian-10    |      10 | available | debian       |
| 64053a48-b20d-4345-860c-cfa0a688816d | talos-v1.5.0 | 1.27.0  | available | talos        |
<!-- END_TF_DOCS -->

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
