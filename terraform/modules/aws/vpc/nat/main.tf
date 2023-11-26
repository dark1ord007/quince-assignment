resource "aws_nat_gateway" "default" {
  allocation_id     = var.allocation_id
  connectivity_type = var.connectivity_type
  subnet_id         = var.subnet_id
  tags              = var.tags
}