variable "ec2" {
  type = map(object({
    ami = string
    instance_type = string
    associate_public_ip_address = bool
    delete_on_termination = bool
    volume_size           = number
    ec2_tags              = string 
  }))
}
variable "key_name" {
  type = string
}
variable "sg_id" {
  type = string
}
variable "subnet" {
  type = string
}
