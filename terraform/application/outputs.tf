output "vpc_arn" {
  value = module.vpc.arn
}

output "private_subnet_arn" {
  value = module.priv_subnet[*].arn
}
output "public_subnet_arn" {
  value = module.pub_subnet[*].arn
}
output "iam_arn" {
  value = module.ec2_role.arn
}
output "instance_id" {
    value = module.ec2.instance_id
}
output "s3_bucket" {
  value = module.s3.bucket
}