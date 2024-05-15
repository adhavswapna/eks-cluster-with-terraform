resource "aws_eks_node_group" "eks_node" {

  
  cluster_name    = aws_eks_cluster.terraform_eks_cluster.name
  node_group_name = "eks_node"
  node_role_arn   = aws_iam_role.eks_node_role.arn
  capacity_type   = "SPOT"
  subnet_ids      = [aws_subnet.eks_private_subnet1.id, aws_subnet.eks_private_subnet2.id]

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }
  


  update_config {
    max_unavailable = 1
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.eks_node-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eks_node-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eks_node-AmazonEC2ContainerRegistryReadOnly,
  ]

  tags = {
    Name        = "eks-node"
    
  }
}