# This resource here is to show you how plan policies work.

resource "random_password" "secret" {
  length  = 8
  special = true
}

resource "aws_iam_role" "my_role" {
  name = "my role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "tag-value"
  }
}