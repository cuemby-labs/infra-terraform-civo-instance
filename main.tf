#
# Locals
#

locals {
  walrus_environment_name = try(local.context["environment"]["name"], null)
}


#
# Civo network
#

resource "civo_network" "example" {
    label          = "${var.instance_hostname}-${local.walrus_environment_name}-network"
    cidr_v4        = var.network_cidr_v4
    region         = var.region
    nameservers_v4 = var.network_nameservers_v4
}

#
# Civo firewall rules
#

resource "civo_firewall" "example" {
    name                 = "${var.instance_hostname}-${local.walrus_environment_name}-fw"
    create_default_rules = false
    network_id           = civo_network.example.id
    region               = var.region

    egress_rule {
        action     = "allow"
        cidr       = var.default_cidr
        label      = "All UDP ports open"
        port_range = "1-65535"
        protocol   = "udp"
    }

    egress_rule {
        action     = "allow"
        cidr       = var.default_cidr
        label      = "All TCP ports open"
        port_range = "1-65535"
        protocol   = "tcp"
    }

    egress_rule {
        action     = "allow"
        cidr       = var.default_cidr
        label      = "Ping/traceroute"
        protocol   = "icmp"
    }

    ingress_rule {
        action     = "allow"
        cidr       = var.local_cidr
        label      = "All UDP ports open"
        port_range = "1-65535"
        protocol   = "udp"
    }

    ingress_rule {
        action     = "allow"
        cidr       = var.local_cidr
        label      = "All TCP ports open"
        port_range = "1-65535"
        protocol   = "tcp"
    }

    ingress_rule {
        action     = "allow"
        cidr       = var.local_cidr
        label      = "Ping/traceroute"
        protocol   = "icmp"
    }

    ingress_rule {
        action     = "allow"
        cidr       = var.external_network
        label      = "Kubectl access"
        port_range = "6443"
        protocol   = "tcp"
    }

    ingress_rule {
        action     = "allow"
        cidr       = var.external_network
        label      = "SSH access"
        port_range = "22"
        protocol   = "tcp"
    }
}

#
# SSH Key creation
#
# To create the example key, run this command:
# ssh-keygen -f ~/.ssh/example-tf -C "terraform-example@localmachine"

resource "civo_ssh_key" "example"{
    name = "${var.instance_hostname}-${local.walrus_environment_name}-ssh-key"
    public_key = var.ssh_public_key
}

#
# Create a new instance
#

resource "civo_instance" "example" {
    hostname    = var.instance_hostname
    tags        = var.instance_tags
    notes       = var.instance_notes
    sshkey_id   = civo_ssh_key.example.id
    firewall_id = civo_firewall.example.id
    network_id  = civo_network.example.id
    size        = var.instance_size
    disk_image  = data.civo_disk_image.debian.os[0].id
    script      = var.script
}

#
# Instance disk image
#

data "civo_disk_image" "os" {
   filter {
        key = "name"
        values = [var.disk_image_name]
   }
}

#
# Walrus information
#

locals {
  context = var.context
}