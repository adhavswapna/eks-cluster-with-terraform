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

# Public Subnet Route Table Association
resource "aws_route_table_association" "RTA_public" {
  subnet_id      = aws_subnet.eks-public_subnet.id
  route_table_id = aws_route_table.public-eks-route.id
}

# Private Subnet Route Table Association
resource "aws_route_table_association" "RTA_private" {
  subnet_id      = aws_subnet.eks-private_subnet.id
  route_table_id = aws_route_table.private-eks-route.id
}
