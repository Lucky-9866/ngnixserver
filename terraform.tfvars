
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
sgrules = [{
  name        = "mysecuritygroup1"
  description = "Allow TLS inbound traffic and all outbound traffic"
  tags = {
    Name = "allow_tls"
  }
  egress = [{
    from_port   = 443
    protocol    = "tcp"
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }]
  ingress = [{
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 22
      protocol    = "tcp"
      to_port     = 22
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}]