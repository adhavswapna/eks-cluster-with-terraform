# Create a VPC
resource "aws_vpc" "eks-vpc" {
  cidr_block = "10.0.0.0/16"
}