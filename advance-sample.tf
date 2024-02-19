provider "aws"{
  region = "sa-east-1"
}

resource "aws_instance" "my_instance" {
     ami = var.image_id
     instance_type = "t2_micro"
     key_name = "universal-key-pair"
     vpc_security_group_ids = [sg-0fe9be4e8d5f63452]
     tags = { 
         name = instance_01 }

}
    
resource "aws_instance" "my_anotherinstance"{
     ami = var.image_id
     instance_type = "t3_micro"
     key_name = "universal-key-pair"
     vpc_security_group_ids = [sg-0fe9be4e8d5f63452]
     tags = { 
         name = instance_0r }

} 
 variable "image_id"{
    default = "ami-0623e7a7b489397c1"
    description = "(optional) describe your variable"
 }

 
    