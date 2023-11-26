resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket                  = var.bucket
  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  restrict_public_buckets = var.restrict_public_buckets
  ignore_public_acls      = var.ignore_public_acls
}
