
resource "aws_iam_user" "s3-eks-terraform" {
  name = "s3-eks-terraform"
}

resource "aws_iam_user_policy" "s3_access_policy" {
  name   = "s3-access-policy"
  user   = aws_iam_user.s3-eks-terraform.name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:ListBucket"
      ],
      "Resource": [
        "arn:aws:s3:::eks-terraform-state-bucket",
        "arn:aws:s3:::eks-terraform-state-bucket/*"
      ]
    }
  ]
}
EOF
}
