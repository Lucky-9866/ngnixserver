module "custom-vpc" {
  source                               = "./aws-vpc"
  for_each                             = { for eachNetwork in var.vpc : index(var.vpc, eachNetwork) => eachNetwork }
  cidr_block                           = each.value.cidr_block
  ipv4_ipam_pool_id                    = each.value.ipv4_ipam_pool_id
  instance_tenancy                     = each.value.instance_tenancy
  ipv6_ipam_pool_id                    = each.value.ipv6_ipam_pool_id
  ipv4_netmask_length                  = each.value.ipv4_netmask_length
  ipv6_cidr_block                      = each.value.ipv6_cidr_block
  ipv6_netmask_length                  = each.value.ipv6_netmask_length
  assign_generated_ipv6_cidr_block     = each.value.assign_generated_ipv6_cidr_block
  enable_dns_hostnames                 = each.value.enable_dns_hostnames
  enable_dns_support                   = each.value.enable_dns_support
  enable_network_address_usage_metrics = each.value.enable_network_address_usage_metrics
  ipv6_cidr_block_network_border_group = each.value.ipv6_cidr_block_network_border_group
  tags                                 = each.value.tags
}

module "subnet" {
  source                          = "./aws-subnet"
  for_each                        = { for eachNetwork in var.subnet : index(var.subnet, eachNetwork) => eachNetwork }
  vpc_id                          = aws_vpc.main.id
  cidr_block                      = each.value.cidr_block
  availability_zone               = each.value.availability_zone
  map_public_ip_on_launch         = each.value.map_public_ip_on_launch
  assign_ipv6_address_on_creation = each.value.assign_ipv6_address_on_creation
  enable_dns64                    = each.value.enable_dns64
  enable_lni_at_device_index      = each.value.enable_lni_at_device_index
  ipv6_cidr_block                 = each.value.ipv6_cidr_block
  ipv6_native                     = each.value.ipv6_native
  tags                            = each.value.tags
}