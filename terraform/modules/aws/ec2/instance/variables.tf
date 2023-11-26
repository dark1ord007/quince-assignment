variable "ami" {
  type        = string
  description = "The AMI to use for the instance."
}

variable "ebs_optimized" {
  type        = bool
  default     = true
  description = "If true, the launched EC2 instance will be EBS-optimized."
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "The type of instance to start. Updates to this field will trigger a stop/start of the EC2 instance."
}

variable "key_name" {
  type        = string
  description = "The key name to use for the instance."
}
variable "monitoring" {
  type        = bool
  default     = true
  description = "If true, the launched EC2 instance will have detailed monitoring enabled. (Available since v0.6.0)."
}
variable "vpc_security_group_ids" {
  type        = list(string)
  description = "A list of security group IDs to associate with."
}
variable "associate_public_ip_address" {
  type        = bool
  description = "Associate a public IP address with the instance."
  default     = false
}
variable "disable_api_termination" {
  type        = bool
  default     = true
  description = "If true, enables EC2 Instance Termination Protection."
}
variable "instance_initiated_shutdown_behavior" {
  type    = string
  default = "terminate"
}
variable "subnet_id" {
  type        = string
  description = "A list of VPC Subnet IDs to launch in."
}
variable "iam_instance_profile" {
  type        = string
  default     = null
  description = "The IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile."
}
variable "tags" {
  type = map(any)
  default ={}
}