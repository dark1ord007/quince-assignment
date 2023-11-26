data "aws_iam_policy_document" "default"{
    dynamic "statement" {
        for_each = var.statement
        content{
            sid = lookup(statement.value,"sid",null)
            actions = lookup(statement.value,"actions",[])
            effect = lookup(statement.value,"effect","Allow")
            dynamic "principals" {
                for_each = lookup(statement.value,"principals",[])
                content {
                    type = principals.value.type
                    identifiers = principals.value.identifiers
                }
            }
            dynamic "condition" {
                for_each = lookup(statement.value,"condition",[])
                content {
                    test = condition.value.test
                    variable = condition.value.variable
                    values = condition.value.values
                }
            }
            resources = lookup(statement.value,"resources",[])
        }
    }
}