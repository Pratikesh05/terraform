provider "aws"{
    region = "ca-central-1"
}
 
 resource"aws_instance" "my_instance"{
     ami = var.image_id
     instance_type = "t2_micro"
     key_pair = "canada-keypairr"
     vpc_security_groups_id = var.vpc_security_groups_id
     tags={
        name = "pavan"
     }
 }


 variable "image_id" {
     default = "ami-0a2e7efb4257c0907"
    }


  variable  "vpc_security_groups_id" {
     default = "sg-0d0cb75235df91852"
    }
    