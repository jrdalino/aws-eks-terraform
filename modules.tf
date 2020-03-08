module "network" {
  source = "./modules/network"

  // pass variables from .tfvars

  // Network - General
  cidr         = var.cidr
  subnet_count = var.subnet_count

  // Network - VPC
  aws_vpc_name = var.aws_vpc_name

  // Network - Internet Gateway
  aws_internet_gateway_name = var.aws_internet_gateway_name

  // Network - Route Tables
  aws_route_table_gateway_name     = var.aws_route_table_gateway_name
  aws_route_table_application_name = var.aws_route_table_application_name
  aws_route_table_database_name    = var.aws_route_table_database_name

  // Network - NAT Gateway
  aws_nat_gateway_name = var.aws_nat_gateway_name

  // Network - Elastic IP
  aws_eip_name = var.aws_eip_name

  // Network - Subnets
  aws_subnet_gateway_name     = var.aws_subnet_gateway_name
  aws_subnet_application_name = var.aws_subnet_application_name
  aws_subnet_database_name    = var.aws_subnet_database_name

  // EKS - Cluster
  aws_eks_cluster_name = var.aws_eks_cluster_name
}

module "eks" {
  source = "./modules/eks"

  // pass variables from .tfvars

  // inputs from modules
  vpc_id                 = module.network.vpc_id
  application_subnet_ids = module.network.application_subnet_ids
  app_gtwy_subnet_ids    = concat(module.network.gateway_subnet_ids, module.network.application_subnet_ids)

  // Network - General
  subnet_count = var.subnet_count  

  // EKS - Cluster
  aws_eks_cluster_name          = var.aws_eks_cluster_name
  accessing_computer_ip         = var.accessing_computer_ip
  aws_iam_role_eks_cluster_name = var.aws_iam_role_eks_cluster_name
  aws_security_group_name       = var.aws_security_group_name

  // EKS - Node Group
  aws_iam_role_node_group_name = var.aws_iam_role_node_group_name
  aws_eks_node_group_name      = var.aws_eks_node_group_name
}