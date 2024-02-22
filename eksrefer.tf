data "aws_iam_policy_document" "clusterassume-role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam-role" {
  name               = "demo-cluster"
  assume_role_policy = data.aws_iam_policy_document.clusterassume-role.json
}

resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::730335216603:role/aws-service-role/eks.amazonaws.com/AWSServiceRoleForAmazonEKS"
  role       = aws_iam_role.iam-role.name
}


resource "aws_iam_role_policy_attachment" "AmazonEKSVPCResourceController" {
  policy_arn = "arn:aws:iam::730335216603:role/aws-service-role/eks.amazonaws.com/AWSServiceRoleForAmazonEKS"
  role       = aws_iam_role.iam-role.name
}

resource "aws_eks_cluster" "eks-cluster" {
  name     = "demo-cluster"
  role_arn = aws_iam_role.iam-role.arn

  vpc_config {
    subnet_ids = [
       ["subnet-092609c135093f9f8","subnet-03e0a226d6e1c5fad"]

    ]
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.AmazonEKSVPCResourceController,
  ]
}