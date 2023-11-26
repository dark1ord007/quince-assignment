variable "app_name" {
	description = "Application Name"
}
variable "policy_arns" {
  description = "Default attach policy to role"
  type = list(string)
}
variable "tags" {
  description = "Tags will have no effect on functioning of the environment."
  type = map
}
variable "assume_role_policy" {
  description = "Assume role policy"
}