module "vpc" {
    source = "./modules/vpc"
    vpc = {
      "vpc-1" = {
        vpc_cidr = "191.168.0.0/16"
        vpc_tags = "mine-vpc1"
      }
    }
    subnet = {
      "sub-1" = {
        availability_zone = "ap-south-2a"
        subnet_tags       = "mine-sub1"
        index             = 0
      }
    }
  
}
output "vpc_ids" {
  value = module.vpc.vpc_ids["vpc-1"]
}
output "subnet_ids" {
  value = module.vpc.subnet_ids[*]
}
module "sg" {
  source = "./modules/sg"
  sg = {
    "sg-1" = {
  sg_name = "mysg1"
  from_port = 22
  to_port   = 80
  protocol  = "tcp"
  cidr_blocks = "0.0.0.0/0"
  sg_tags     = "sg1"
  }
  }
  vpc_id = module.vpc.vpc_ids["vpc-1"]
}
output "sg_ids" {
  value = module.sg.sg_ids["sg-1"]
}
module "ec2" {
  source = "./modules/ec2"
  ec2 = {
    "ec2-1" = {
  ami = ""
  instance_type = "t3.micro"
  associate_public_ip_address = true
  delete_on_termination       = true
  volume_size                 = 20
  ec2_tags                    = "MYEC2"
}
  }
key_name      = ""
sg_id         = module.sg.sg_ids["sg-1"]
subnet        = module.vpc.subnet_ids["sub-1"]  
}
