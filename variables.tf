variable "vpc" {
  type = list(object({
    cidr_block                           = optional(string)
    instance_tenancy                     = optional(string)
    ipv4_ipam_pool_id                    = optional(string)
    ipv4_netmask_length                  = optional(string)
    ipv6_cidr_block                      = optional(string)
    ipv6_ipam_pool_id                    = optional(string)
    ipv6_netmask_length                  = optional(string)
    ipv6_cidr_block_network_border_group = optional(string)
    enable_dns_support                   = optional(string)
    enable_network_address_usage_metrics = optional(string)
    enable_dns_hostnames                 = optional(string)
    assign_generated_ipv6_cidr_block     = optional(string)
    tags                                 = optional(map(string))
  }))
  default = []
}
variable "subnet" {
  description = "A list of subnet configurations"
  type = list(object({
    name                            = optional(string)
    vpc_id                          = optional(string)
    cidr_block                      = optional(string)
    availability_zone               = optional(string)
    map_public_ip_on_launch         = optional(string)
    assign_ipv6_address_on_creation = optional(string)
    enable_dns64                    = optional(string)
    enable_lni_at_device_index      = optional(string)
    ipv6_cidr_block                 = optional(string)
    ipv6_native                     = optional(string)
    tags                            = map(string)
  }))
}

variable "sgrules" {
  type = list(object({
    name                   = optional(string)
    description            = optional(string)
    name_prefix            = optional(string)
    revoke_rules_on_delete = optional(string)
    vpc_id                 = optional(string)
    tags                   = optional(map(string))
    egress = optional(list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = optional(list(string))
    })))
    ingress = optional(list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = optional(list(string))
    })))
  }))
}