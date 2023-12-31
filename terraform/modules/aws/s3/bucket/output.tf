output "id" {
  description = "The name of the bucket."
  value       = aws_s3_bucket.default.id
}
output "bucket" {
  description = "Return bucket."
  value       = aws_s3_bucket.default.bucket
}
output "arn" {
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
  value       = aws_s3_bucket.default.arn
}

output "domain_name" {
  description = "The bucket domain name. Will be of format bucketname.s3.amazonaws.com."
  value       = aws_s3_bucket.default.bucket_domain_name
}

output "regional_domain_name" {
  description = "The bucket region-specific domain name. The bucket domain name including the region name, please refer here for format. Note: The AWS CloudFront allows specifying S3 region-specific endpoint when creating S3 origin, it will prevent redirect issues from CloudFront to S3 Origin URL."
  value       = aws_s3_bucket.default.bucket_regional_domain_name
}

output "hosted_zone_id" {
  description = "The Route 53 Hosted Zone ID for this bucket's region."
  value       = aws_s3_bucket.default.hosted_zone_id
}

output "region" {
  description = "The AWS region this bucket resides in."
  value       = aws_s3_bucket.default.region
}
