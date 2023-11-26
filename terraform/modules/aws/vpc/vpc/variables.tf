variable "cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "instance_tenancy" {
  type        = string
  default     = null
  description = "Set default tenancy for all instances launched in this VPC"
}

variable "enable_dns_hostnames" {
  type        = bool
  default     = true
  description = "Enable/Disable hostnames in VPC"
}

variable "enable_dns_support" {
  type        = bool
  default     = true
  description = "Enable dns support in VPC"
}

variable "tags" {
  type = map(any)
}