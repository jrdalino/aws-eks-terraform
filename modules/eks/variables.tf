# Network - General
variable "subnet_count" {
  type        = string
  description = "The number of subnets we want to create per type to ensure high availability."
}

# Network - Outputs From Network Module
variable "vpc_id" {
  type        = string
  description = "ID of the VPC."
}

variable "application_subnet_ids" {
  type        = list
  description = "List of Application Subnet IDs."
}

variable "app_gtwy_subnet_ids" {
  type        = list
  description = "List of Application and Gateway Subnet IDs."
}

# EKS - Cluster
variable "aws_eks_cluster_name" {
  type        = string
  description = "The name of the EKS Cluster that will be deployed in this VPC."
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