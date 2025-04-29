variable "sg" {
   type = map(object({
     
        sg_name = string
        from_port = number
        to_port   = number
        protocol  = string
        cidr_blocks = string
        sg_tags     = string
     } 
   )
   )
}
variable "vpc_id" {
  type = string
}
