variable "statement" {
  description = "Statement as list of objects"
  default = []
#   type = list(object({
#       sid = optional(string)
#       effect = optional(string)
#       actions = optional(list(string))
#       principals = optional(list(object({
#           type = string
#           identifier = list(string)
#       })))
#       condition = optional(list(object({
#           test = string
#           variable = string
#           values = list(string)
#       })))
#       resources = optional(list(string))
#     }))
}