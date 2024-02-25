provider "aws"{
    region= "sa-east-1"
}
resource "aws_launch_configuration_lc-home"{
      image_type = var.image_type
      image_id = var.image_id
      key_pair = var.key_id
      name = "${var.project} lc-home"
      security_groups = [var.security_group_id]
      user_data = <<-EOF

            #!/bin/bash
            yum install httpd -y
            echo "<h1> Hello World, Welcome to Cloudblitz" > /var/www/html/index.html
            systemctl start httpd
            systemctl enable httpd

            EOF


}

    resource "aws_launch_configuration_lc-latop"{
      image_type = var.image_type
      image_id = var.image_id
      key_pair = var.key_id
      name = "${var.project} lc-laptop"
      security_groups = [var.security_group_id]
      user_data = <<-EOF
      
            #!/bin/bash
            yum install httpd -y
            echo "<h1> Hello World, Welcome to Cloudblitz" > /var/www/html/laptop/index.html/
            systemctl start httpd
            systemctl enable httpd

            EOF


}

resource "aws_launch_configuration_lc-mobile"{
      image_type = var.image_type
      image_id = var.image_id
      key_pair = var.key_id
      name = "${var.project} lc-mobile"
      security_groups = [var.security_group_id]
      user_data = <<-EOF
      
            #!/bin/bash
            yum install httpd -y
            echo "<h1> Hello World, Welcome to Cloudblitz" > /var/www/html/mobile/index.html/
            systemctl start httpd
            systemctl enable httpd

            EOF
