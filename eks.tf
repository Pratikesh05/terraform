provider "aws"{
     region= "sa-east-1"
}


 resource "aws_eks_cluster"{
      name = "demo-cluster"
     role_arn = arn:aws:iam::730335216603:role/aws-service-role/eks.amazonaws.com/AWSServiceRoleForAmazonEKS
     vpc_config = "vpc-0eafd3785b9104a93"
     endpoint_private_access = "false"
     endpoint_public_access = "true"
     public_access_cidrs = "0.0.0.0/0"
     security_group_ids = "sg-0c05fe70a4b0da8c5"
     subnet_ids = ["subnet-092609c135093f9f8","subnet-03e0a226d6e1c5fad"]

}

