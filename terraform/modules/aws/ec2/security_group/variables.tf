variable "ingresses" {
  type        = list
  default     = []
  description = "A list of ingress ports."
}

variable "egresses" {
  type        = list
  default     = []
  description = "A list of ingress ports."
}


variable "name" {
  type        = string
  description = "security group name."
}

variable "description" {
  type = string
  description = "security group description."
}