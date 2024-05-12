resource "aws_route_table" "public-eks-route" {
  vpc_id = aws_vpc.eks-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks-igw.id
  }

  tags = {
    Name = "public-eks-route"
  }
}

resource "aws_route_table" "private-eks-route" {
  vpc_id = aws_vpc.eks-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.eks_nat.id
  }

  tags = {
    Name = "private-eks-route"
  }
}

resource "aws_route_table_association" "RTA1" {
  subnet_id      = aws_subnet.eks-public_subnet1.id
  route_table_id = aws_route_table.public-eks-route.id
}

resource "aws_route_table_association" "RTA2" {
  subnet_id      = aws_subnet.eks-public_subnet2.id
  route_table_id = aws_route_table.public-eks-route.id
}

resource "aws_route_table_association" "RTA3" {
  subnet_id      = aws_subnet.eks_private_subnet1.id
  route_table_id = aws_route_table.private-eks-route.id
}

resource "aws_route_table_association" "RTA4" {
  subnet_id      = aws_subnet.eks_private_subnet2.id
  route_table_id = aws_route_table.private-eks-route.id
}

