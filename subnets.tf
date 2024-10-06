resource "aws_subnet" "eks-public_subnet" {
  vpc_id     = aws_vpc.eks-vpc.id
  cidr_block = "10.0.0.0/19"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "eks-public_subnet"
  }
}

resource "aws_subnet" "eks-private_subnet" {
  vpc_id     = aws_vpc.eks-vpc.id
  cidr_block = "10.0.64.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "eks-private_subnet"
  }
}



