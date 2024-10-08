resource "aws_eks_cluster" "terraform_eks_cluster" {
  name     = "terraform_eks_cluster"
  role_arn = aws_iam_role.eks_role.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.eks-public_subnet.id, 
      aws_subnet.eks_private_subnet.id
      ]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.terraform_eks_cluster-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.terraform_eks_cluster-AmazonEKSVPCResourceController,
  ]
}

