provider "aws"{
    region = "ca-central-01"
}

resource "aws_iam" "my_user"{
     arn = "https://console.aws.amazon.com/iam/"
      name = "user01"
          password ="123456"
    path = "var.iam_id" 


}

variable " iam_id"{
    default = ""
}