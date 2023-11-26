resource "aws_instance" "instance" {
  ami                                  = var.ami
  ebs_optimized                        = var.ebs_optimized
  instance_type                        = var.instance_type
  key_name                             = var.key_name
  monitoring                           = var.monitoring
  vpc_security_group_ids               = var.vpc_security_group_ids
  subnet_id                            = var.subnet_id
  associate_public_ip_address          = var.associate_public_ip_address
  disable_api_termination              = var.disable_api_termination
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior
  iam_instance_profile                 = var.iam_instance_profile
  tags                                 = var.tags
}