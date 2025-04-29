resource "aws_vpc" "main" {
  #count = length(local.vpc_tags)
  for_each = var.vpc
  cidr_block = each.value.vpc_cidr
  instance_tenancy = "default"
  tags = {
    Name = each.value.vpc_tags
  }
}
resource "aws_subnet" "subnet" {
  #count = length(local.subnet_tags)
  for_each = var.subnet
  cidr_block = cidrsubnet(var.vpc["vpc-1"].vpc_cidr,8,each.value.index) #var.subnet_cidr[count.index]
  vpc_id = aws_vpc.main["vpc-1"].id
  availability_zone = each.value.availability_zone
  tags = {
     Name = each.value.subnet_tags
  }
  
}
