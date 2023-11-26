output "instance_id" {
  value       = aws_instance.instance.*.id
  description = "The instance ID."
}

output "key_name" {
  value       = join("", aws_instance.instance.*.key_name)
  description = "The key name of the instance."
}