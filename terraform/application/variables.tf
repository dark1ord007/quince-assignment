variable "aws" {
  default = {
    region  = "ap-south-1"
  }
}
variable "vpc" {
  description = "All values for VPC module"
  default = {
    cidr_block = ""
    name       = "default"
  }
}
variable "priv_subnets" {
  description = "All values for subnets module"
  default = {
    net_bits = 7
  }
}
variable "pub_subnets" {
  description = "All values for subnets module"
  default = {
    net_bits = 7
  }
}
variable "nat" {
  description = "All values for nat module"
  default = {
    connectivity_type = "public"
  }
}
variable "ec2" {
  description = "All variables related to EC2"
}

variable "sg" {
  default = {}
  description = "All variables related to Security Group "
}
variable "role" {
  description = "All variables related to role"
}
variable "role_assume_policy" {
  description = "Default assume role policy"
  default = [{
      actions          = ["sts:AssumeRole"]
      principals       = [{
        type           = "Service"
        identifiers    = ["ec2.amazonaws.com"]
        }
      ]
      effect            = "Allow"
    }]
}
variable "s3" {
  description = "All value require for s3"
  default = {
    bucket_name = "default"
  }
}
variable "tags" {
  description = "All values for tags"
  type        = map(string)
  default = {
    "app_name" = "default"
  }
}