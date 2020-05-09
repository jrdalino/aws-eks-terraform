# General
aws_region  = "ap-southeast-1"
aws_account = "707538076348"

# Network - General
cidr         = "10.0.0.0/16"
subnet_count = "2"

# Network - VPC
aws_vpc_name = "myproject-vpc"

# Network - Internet Gateway
aws_internet_gateway_name = "myproject-internet-gateway"

# Network - Route Tables
aws_route_table_gateway_name     = "myproject-gateway-route-table"
aws_route_table_application_name = "myproject-application-route-table"
aws_route_table_database_name    = "myproject-database-route-table"

# Network - NAT Gateway
aws_nat_gateway_name = "myproject-nat-gateway"

# Network - Elastic IP
aws_eip_name = "myproject-nat-gateway-eip"

# Network - Subnets
aws_subnet_gateway_name     = "myproject-gateway-subnet"
aws_subnet_application_name = "myproject-application-subnet"
aws_subnet_database_name    = "myproject-database-subnet"

# EKS - Cluster
aws_eks_cluster_name          = "myproject-eks"
accessing_computer_ip         = "210.10.0.22" # Replace this with your Public IP
aws_iam_role_eks_cluster_name = "myproject-eks-cluster-service-role"
aws_security_group_name       = "myproject-eks-cluster-to-worker-nodes-security-group"

# EKS - Node Group
aws_iam_role_node_group_name = "myproject-node-group-instance-role"
aws_eks_node_group_name      = "myproject-node-group"  
