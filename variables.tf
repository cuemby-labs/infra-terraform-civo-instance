#
# Variables for Civo compute instance
#

variable "instance_hostname" {
  description = "Hostname for the Civo compute instance"
  type        = string
}

variable "instance_size" {
  description = "Civo compute instance size"
  type        = string
  default     = "g3.xsmall"
}

variable "instance_notes" {
  description = "Civo compute instance notes"
  type        = string
  default     = "This is an example instance"
}

variable "region" {
  description = "Civo region to deploy the cluster"
  type        = string
  default     = "NYC1"
}

variable "ssh_public_key" {
  type        = string
  description = "The public SSH key to be used for Civo instance"
  sensitive   = true
}

variable "disk_image_name" {
  description = "The name of the disk image to filter by, e.g. debian-11, ubuntu-jammy, run 'civo diskimage ls' to get the list"
  type        = string
  default     = "debian-11"
}

variable "instance_tags" {
  description = "List for instance tags"
  type        = list(string)
  default     = null
}

variable "script" {
  description = "Script for the Compute Instance"
  type        = string
  default     = null
}

#
# Variables for Civo network
#

variable "network_cidr_v4" {
  description = "CIDR block for the network"
  type        = string
  default     = "192.168.0.0/24"
}

variable "network_nameservers_v4" {
  description = "List of nameservers for the network"
  type        = list(string)
  default     = ["8.8.8.8", "1.1.1.1"]
}

#
# Variables for Civo firewall
#

variable "external_network" {
  description = "external CIDR for kubectl access"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "default_cidr" {
  description = "default CIDR 0.0.0.0/0"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "local_cidr" {
  description = "Local CIDR for ingress firewall rules"
  type        = list(string)
  default     = ["192.168.0.0/24"]
}

#
# Walrus Contextual Fields
#

variable "context" {
  description = <<-EOF
Receive contextual information. When Walrus deploys, Walrus will inject specific contextual information into this field.

Examples:
```
context:
  project:
    name: string
    id: string
  environment:
    name: string
    id: string
  resource:
    name: string
    id: string
```
EOF
  type        = map(any)
  default     = {}
}