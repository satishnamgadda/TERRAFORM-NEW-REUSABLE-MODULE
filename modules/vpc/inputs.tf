variable "vpc" {
    type = map(object({
      vpc_cidr = string
      vpc_tags = string
    }))
   
}
variable "subnet" {
  type = map(object({
    availability_zone = string
    subnet_tags       = string
    index             = number
  }))
}

