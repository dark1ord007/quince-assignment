vpc = {
  cidr_block        = "10.10.0.0/16"
  name              = "default"
}
priv_subnets = {
    availability_zone       = ["ap-south-1a","ap-south-1b"]
    net_bits                = 7
    tags                    = {
        tier                = "private"
    }
}
pub_subnets = {
    availability_zone       = ["ap-south-1a","ap-south-1b"]
    net_bits                = 7
    tags                    = {
        tier                = "public"
    }
}
ec2 = {
  ami =  "ami-076e3a557efe1aa9c"
  instance_type = "t3a.micro"
  key_name = "default"
  monitoring = true
  security_groups = []
}
role = {
  policy_arns = []
}
sg = {
name = "ssh-internal"
description = "Allow ssh from internal network"
ingresses = [
    {
      from_port = "22"
      to_port   = "22"
      protocol  = "tcp"
      cidr_blocks = ["10.10.0.0/16"]
    }
  ]
egresses = []
}
s3 = {
    bucket_name = "default"
}
tags = {
    app_name                = "default"
    team                    = "default"
    ticket                  = "TODO" 
}