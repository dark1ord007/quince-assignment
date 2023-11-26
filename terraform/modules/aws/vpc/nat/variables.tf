variable "allocation_id" {
  description = "The Allocation ID of the Elastic IP address for the gateway. Required if connectivity type is public"
  default     = null
  type        = string
}

variable "connectivity_type" {
  description = "Connectivity type for the gateway."
  default     = null
  type        = string
}

variable "subnet_id" {
  description = "The Subnet ID of the subnet in which to place the gateway."
  type        = any
}

variable "tags" {
  type = map(any)
}