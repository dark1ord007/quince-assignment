resource "aws_iam_role" "default" {
  name  = "${var.app_name}"
  assume_role_policy = var.assume_role_policy.json
  managed_policy_arns = var.policy_arns
  tags = var.tags
}