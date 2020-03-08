# Network - General
variable "cidr" {
  type        = string
  description = "Used CIDR for VPC."
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
  description = "The name of the EKS Cluster that will be deployed in this VPC."
}