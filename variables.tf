# General
variable "aws_region" {
  type        = string
  description = "AWS Region."
} 

variable "aws_account" {
  type        = string
  description = "AWS Account."    
}

# Network - General
variable "cidr" {
  type        = string
  description = "CIDR for VPC."
}

variable "subnet_count" {
  type        = string
  description = "The number of subnets we want to create per type to ensure high availability."
}

# Network - VPC
variable "aws_vpc_name" {
  type        = string
  description = ""
}

# Network - Internet Gateway
variable "aws_internet_gateway_name" {
  type        = string
  description = ""
}

# Network - Route Tables
variable "aws_route_table_gateway_name" {
  type        = string
  description = ""
}

variable "aws_route_table_application_name" {
  type        = string
  description = ""
}

variable "aws_route_table_database_name" {
  type        = string
  description = ""
}

# Network - NAT Gateway
variable "aws_nat_gateway_name" {
  type        = string
  description = ""
}

# Network - Elastic IP
variable "aws_eip_name" {
  type        = string
  description = ""
}

# Network - Subnets
variable "aws_subnet_gateway_name" {
  type        = string
  description = ""
}

variable "aws_subnet_application_name" {
  type        = string
  description = ""
}

variable "aws_subnet_database_name" {
  type        = string
  description = ""
}

# EKS - Cluster
variable "aws_eks_cluster_name" {
  type        = string
  description = ""
}

variable "accessing_computer_ip" {
  type        = string
  description = "IP of the computer to be allowed to connect to EKS master and nodes."
}

variable "aws_iam_role_eks_cluster_name" {
  type        = string
  description = ""
}

variable "aws_security_group_name" {
  type        = string
  description = ""
}

# EKS - Node Group
variable "aws_iam_role_node_group_name" {
  type        = string
  description = ""
}

variable "aws_eks_node_group_name" {
  type        = string
  description = ""
}