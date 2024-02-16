provider "aws"{
    region = "ca-central-1"
}
 
 resource"aws_instance" "my_instance" {
     ami = var.image_id
     instance_type = "t2.micro"
     key_name = "canada-keypairr"
     vpc_security_group_ids = ["sg-0d0cb75235df91852"]
     tags = {
         name = "pavan"
     }
 }


 variable "image_id" {
     default = "ami-0a2e7efb4257c0907"
    }


    