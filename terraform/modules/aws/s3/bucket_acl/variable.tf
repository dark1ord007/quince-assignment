variable "bucket" {
  description = "The name of the S3 Bucket"
}

variable "acl" {
  type    = string
  default = "private"
}