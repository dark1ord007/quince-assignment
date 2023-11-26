# S3 bucket variables:
variable "bucket_name" {
  description = "The name of the S3 Bucket"
  type        = string  
  default = ""
}

variable "tags" {
  description = "A mapping of tags to assign to the bucket."
  type        = map(string)
  default     = {}
}
