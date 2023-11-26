variable "vpc_id" {
  type        = string
  description = "ID of the VPC to create the subnet in"
}

variable "cidr_block" {
  type        = string
  description = "CIDR block for the subnet"
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Makes the subnet public(true) or private(false)"
}

variable "availability_zone" {
  type        = string
  description = "AZ to launch the subnet in"
}

variable "tags" {
  type = map(any)
}