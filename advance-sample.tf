provider "aws" {
    region = "ca-central-1"
}

resource "aws_instance" "my_instance{
     ami = var.image_id
     instance_type = "t2_micro"
     key_name = "canda keyparir"
     vpc_security_group_ids = []
     tags = { 
         name = instance_01 }


} 
 variable "image_id" {
    default = 
    description = "(optional) describe your variable"
 }