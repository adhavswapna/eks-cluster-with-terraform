resource "aws_subnet" "eks-public_subnet1" {
  vpc_id     = aws_vpc.eks-vpc.id
  cidr_block = "10.0.0.0/19"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "eks-public_subnet1"
  }
}


resource "aws_subnet" "eks-public_subnet2" {
  vpc_id     = aws_vpc.eks-vpc.id
  cidr_block = "10.0.32.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "eks-public_subnet2"
  }
}


resource "aws_subnet" "eks_private_subnet1" {
  vpc_id     = aws_vpc.eks-vpc.id
  cidr_block = "10.0.64.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "eks_private_subnet1"
  }
}

resource "aws_subnet" "eks_private_subnet2" {
  vpc_id     = aws_vpc.eks-vpc.id
  cidr_block = "10.0.96.0/24"
  availability_zone = "us-east-1b"


  tags = {
    Name = "eks_private_subnet2"
  }
}