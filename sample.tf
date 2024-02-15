provider= "aws"{
    region= "ca-central-1"
}
 
 resource= "aws_instance" "my_instance"{
     ami= "var.image_id"
     instance_type= "t2_micro"
     key_pai= "canada-keypairr"
     vpc_security_groups_id= "default"
 }