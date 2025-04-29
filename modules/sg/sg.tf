resource "aws_security_group" "sec_grp" {
  for_each = { for k, value in var.sg : k => value }
  vpc_id = var.vpc_id
  name = each.value.sg_name
  ingress {
    from_port = each.value.from_port
    to_port = each.value.to_port
    protocol = each.value.protocol
    cidr_blocks = [ each.value.cidr_blocks ]
  }
  egress {
     from_port = 0
     to_port = 0
     protocol = "-1"
     cidr_blocks = [ "0.0.0.0/0" ]
  }
  tags = {
    Name = each.value.sg_tags
  }
}
