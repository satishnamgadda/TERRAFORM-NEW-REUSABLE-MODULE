resource "aws_instance" "instance" {
  for_each = { for k, v in var.ec2 : k => v }
  ami = each.value.ami
  instance_type = each.value.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [ var.sg_id ]
  associate_public_ip_address = each.value.associate_public_ip_address
  subnet_id = var.subnet_id
  root_block_device {
    delete_on_termination = each.value.delete_on_termination
    volume_size  = each.value.volume_size
  }
  
  tags = {
    Name = each.value.ec2_tags
  }
}