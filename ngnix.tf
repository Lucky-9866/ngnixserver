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
  vpc_id                          = each.value.vpc_id
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

module "security-groups" {
  source      = "./aws-security"
  depends_on = [ module.custom-vpc ]
  vpc_id      = module.custom-vpc[0].vpc_id
  for_each    = { for eachRule in var.sgrules : eachRule.name => eachRule }
  sgname      = each.value.name
  description = each.value.description
  tags        = each.value.tags
  ingress     = each.value.ingress
  egress      = each.value.egress
}
module "route-table" {
  source                     = "./aws-routetable"
  for_each                   = { for eachNetwork in var.route_table : eachNetwork.cidr_block[0] => eachNetwork }
  vpc_id                     = each.value.vpc_id
  carrier_gateway_id         = each.value.carrier_gateway_id
  cidr_block                 = each.value.cidr_block
  core_network_arn           = each.value.core_network_arn
  destination_prefix_list_id = each.value.destination_prefix_list_id
  egress_only_gateway_id     = each.value.egress_only_gateway_id
  ipv6_cidr_block            = each.value.ipv6_cidr_block
  gateway_id                 = each.value.gateway_id
  local_gateway_id           = each.value.local_gateway_id
  nat_gateway_id             = each.value.nat_gateway_id
  network_interface_id       = each.value.network_interface_id
  transit_gateway_id         = each.value.transit_gateway_id
  vpc_endpoint_id            = each.value.vpc_endpoint_id
  vpc_peering_connection_id  = each.value.vpc_peering_connection_id
  tags                       = each.value.tags


}