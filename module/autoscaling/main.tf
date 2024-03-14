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
}

resource "aws_autoscaling_group"{
      name = "${var.project}-as-home"
      max _size = var.max_size
      min_size = var.min_size
      desired_capacity = var.desired_capacity
      avalibality_zone = var.avalibality_zone
      aws_launch_configuration = aws_launch_configuration.lc.home.name           
       tags = {
            key = name
            value  = home
            proprgate_at_launch = true
       }
      }


resource "aws_autoscaling_policy" "as_policy_home"{
      aws_autoscaling_group_name = aws_autoscaling_policy-as_home_name
      name = "${var.project}-as-policy_home"
      policy_type = "predictivescaling"
      predictive_scaling_configuration {
            metric_specification {
                  target_value = 50
                  predefine_metric_specification {
                        predefine_metric_type = "ASGTotalutilization"
                        resource_label = " "
                  }
            customized_scaling_metric_specfication{
                  metric_data_queries{
                        id = "scaling"
                        metric_start{
                              metric_name = "CPUUtilization"
                              namespace = "AWS/EC2"
                              dimension{
                                    name = "AutosaclingGroupName"
                                    value = "aws_autoscaling_policy-as_home_name"

                              }
                    
                        }
                  }     start = "Average"

            }
            
            }
            
      }


}