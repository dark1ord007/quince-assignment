resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = var.bucket
  acl    = var.acl
}
