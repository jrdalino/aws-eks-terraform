# IAM Role - Node Group
resource "aws_iam_role" "node_group" {
  name = var.aws_iam_role_node_group_name
 
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

# IAM Policy Attachment - Node Group Policy 
resource "aws_iam_role_policy_attachment" "node_group_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.node_group.name
}

# IAM Policy Attachment - EKS CNI Policy
resource "aws_iam_role_policy_attachment" "cni_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.node_group.name
}
 
# IAM Policy Attachment - Container Registry Read Only
resource "aws_iam_role_policy_attachment" "ecr_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.node_group.name
}

# IAM Policy Attachment - DynamoDB Policy
resource "aws_iam_role_policy_attachment" "dynamodb_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
  role       = aws_iam_role.node_group.name
}

# Node Group
resource "aws_eks_node_group" "this" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = var.aws_eks_node_group_name
  node_role_arn   = aws_iam_role.node_group.arn
  subnet_ids      = var.application_subnet_ids

  scaling_config {
    desired_size = var.subnet_count
    max_size     = var.subnet_count
    min_size     = var.subnet_count
  }

  depends_on = [
    aws_iam_role_policy_attachment.node_group_policy,
    aws_iam_role_policy_attachment.cni_policy,
    aws_iam_role_policy_attachment.ecr_policy,
  ]
}