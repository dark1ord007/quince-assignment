locals {
  private_subnets = [for cidr_block in cidrsubnets("${var.vpc.cidr_block}", 1, 1) : cidrsubnets(cidr_block, var.priv_subnets.net_bits, var.priv_subnets.net_bits, var.priv_subnets.net_bits)][0]
  public_subnets  = [for cidr_block in cidrsubnets("${var.vpc.cidr_block}", 1, 1) : cidrsubnets(cidr_block, var.pub_subnets.net_bits, var.pub_subnets.net_bits, var.pub_subnets.net_bits)][1]
}

module "vpc" {
  source     = "../modules/aws/vpc/vpc"
  cidr_block = var.vpc.cidr_block
  tags       = merge(var.tags, { Name = "${var.vpc.name}" })
}

module "eip" {
  source = "../modules/aws/ec2/eip"
  domain = "vpc"
}

module "nat" {
  source            = "../modules/aws/vpc/nat"
  allocation_id     = module.eip.id
  connectivity_type = var.nat.connectivity_type
  subnet_id         = module.pub_subnet[1].id
  tags              = merge(var.tags, { Name = "${var.vpc.name}-${var.pub_subnets.availability_zone[1]}" })
}
module "priv_subnet" {
  source                  = "../modules/aws/vpc/subnet"
  count                   = length(var.pub_subnets.availability_zone)
  vpc_id                  = module.vpc.id
  cidr_block              = local.private_subnets[count.index]
  map_public_ip_on_launch = false
  availability_zone       = var.priv_subnets.availability_zone[count.index]
  tags                    = merge(var.tags, var.priv_subnets.tags, { Name = "${var.vpc.name}-private-${var.priv_subnets.availability_zone[count.index]}" })
}

module "pub_subnet" {
  source                  = "../modules/aws/vpc/subnet"
  count                   = length(var.pub_subnets.availability_zone)
  vpc_id                  = module.vpc.id
  cidr_block              = local.public_subnets[count.index]
  map_public_ip_on_launch = true
  availability_zone       = var.pub_subnets.availability_zone[count.index]
  tags                    = merge(var.tags, var.pub_subnets.tags, { Name = "${var.vpc.name}-public-${var.pub_subnets.availability_zone[count.index]}" })
}

module "sg" {
   source                          = "../modules/aws/ec2/security_group"
   name                            = var.sg.name
   description                     = var.sg.description
   ingresses                       = var.sg.ingresses
   egresses                        = var.sg.egresses
}

module "ec2" {
  source                               = "../modules/aws/ec2/instance"
  ami                                  = var.ec2.ami
  instance_type                        = lookup(var.ec2,"instance_type","t2.small")
  key_name                             = var.ec2.key_name
  monitoring                           = lookup(var.ec2,"monitoring",true)
  vpc_security_group_ids               = [module.sg.id]
  subnet_id                            = module.priv_subnet[1].id
  associate_public_ip_address          = lookup(var.ec2,"associate_public_ip_address",false)
  disable_api_termination              = lookup(var.ec2,"disable_api_termination",true)
  iam_instance_profile                 = module.ec2_role.arnq
  tags                                 = merge(var.tags,{ Name = "${var.tags.app_name}"})
}

module "ec2_account_assume_policy" {
  source    = "../modules/aws/iam/policy_document"
  statement = lookup(var.role,"assume_policy",var.role_assume_policy)
}

module "ec2_role" {
  source             = "../modules/aws/iam/role"
  app_name           = "${var.tags.app_name}-ec2"
  policy_arns        = var.role.policy_arns
  tags               = var.tags
  assume_role_policy = module.ec2_account_assume_policy.policy
}
module "s3" {
  source          = "../modules/aws/s3/bucket"
  bucket_name     = var.s3.bucket_name
  tags            = var.tags
}
module "s3_acl" {
  source            = "../modules/aws/s3/bucket_acl"
  bucket            = module.s3.bucket
  acl               = lookup(var.s3,"acl","private")
}
module "s3_public_block" {
  source                    = "../modules/aws/s3/bucket_public_access_block"
  bucket                    = module.s3.bucket
  block_public_acls         = lookup(var.s3,"block_public_acls",true)
  block_public_policy       = lookup(var.s3,"block_public_policy",true)
  restrict_public_buckets   = lookup(var.s3,"restrict_public_buckets",true)
  ignore_public_acls        = lookup(var.s3,"ignore_public_acls",true)
}