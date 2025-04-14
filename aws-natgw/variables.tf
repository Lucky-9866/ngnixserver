variable "allocation_id" {
  type = string
}
variable "connectivity_type" {
   type = string
}
variable "private_ip" {
   type = string
}
variable "subnet_id " {
   type = string
}
variable " secondary_allocation_ids" {
  type = string
}
variable "secondary_private_ip_address_count" {
  type = string
}
variable "secondary_private_ip_addresses" {
  type = string
}
variable "tags" {
   type = map(string) 
}