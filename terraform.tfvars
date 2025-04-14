
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

route_table = [{
  cidr_block = ["10.0.0.0/21"]
  vpc_id     = "vpc-xxxxxxxx"
  tags       = { "Name" : "route_table" }
}]

routetableassoc = [{
  route_table_id  = "rtb-0ebc0a35016475ecd"
  subnet_id       = "subnet-0caafad8c1d8c5063"
}]
igw = [{
  vpc_id     = "vpc-xxxxxxxx"
}]

instance = [{
  ami                         = "ami-00bb6a80f01f03502"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  tags                        = "name : aws_instance"  
}]
nat = [{
   allocation_id            = "*******"
   private_ip               = "*******"
   subnet_id                = "subnet-0caafad8c1d8c5063"
}]