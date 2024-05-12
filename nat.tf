resource "aws_nat_gateway" "eks_nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.eks-public_subnet1.id
}

resource "aws_eip" "nat_eip" {
}

