
vpc = [{
  cidr_block = "10.0.0.0/21"
  tags       = { "Name" : "my vpc" }
}]
subnet = [{
  name                            = "subnet-1"
  vpc_id                          = "vpc-0abcd1234efgh5678"
  cidr_block                      = "10.0.0.0/22"
  availability_zone               = "ap-south-1a"
  tags                            = {Name = "my subnet"}
}]