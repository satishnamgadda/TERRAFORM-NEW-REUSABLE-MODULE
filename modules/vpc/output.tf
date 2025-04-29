output "vpc_ids" {
  value = {
    for key, vpc in aws_vpc.main : key => vpc.id
  }
}
output "subnet_ids" {
  value = {
    for k, subnet in aws_subnet.subnet : k => subnet.id
  }
}