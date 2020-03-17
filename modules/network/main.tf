data "aws_availability_zones" "available" {
}

# VPC
resource "aws_vpc" "this" {
  cidr_block           = var.cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
     Name                                                = var.aws_vpc_name
     "kubernetes.io/cluster/${var.aws_eks_cluster_name}" = "shared"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = var.aws_internet_gateway_name
  }
}

# Route Table - Gateway
resource "aws_route_table" "gateway" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name    = var.aws_route_table_gateway_name
    Network = "public"
  }
}

# Route Table - Application
resource "aws_route_table" "application" {
  count  = var.subnet_count
  vpc_id = aws_vpc.this.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.this.*.id[count.index]
  }

  tags = {
    Name    = var.aws_route_table_application_name
    Network = "private"
  }
}

# Route Table - Database
resource "aws_route_table" "database" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name    = var.aws_route_table_database_name
    Network = "private"
  }
}

# Nat Gateway
resource "aws_nat_gateway" "this" {
  count         = var.subnet_count
  allocation_id = aws_eip.nat_gateway.*.id[count.index]
  subnet_id     = aws_subnet.gateway.*.id[count.index]

  tags = {
    Name = var.aws_nat_gateway_name
  }

  depends_on = [aws_internet_gateway.this]
}

# Elastic IP
resource "aws_eip" "nat_gateway" {
  count = var.subnet_count
  vpc   = true

  tags = {
    Name = var.aws_eip_name
  }  
}

# Subnet - Gateway
resource "aws_subnet" "gateway" {
  count             = var.subnet_count
  availability_zone = data.aws_availability_zones.available.names[count.index]
  cidr_block        = "10.0.1${count.index}.0/24"
  vpc_id            = aws_vpc.this.id

  tags = {
     Name                     = var.aws_subnet_gateway_name
     "kubernetes.io/role/elb" = "1"
  }
}

# Subnet - Application
resource "aws_subnet" "application" {
  count             = var.subnet_count
  availability_zone = data.aws_availability_zones.available.names[count.index]
  cidr_block        = "10.0.2${count.index}.0/24"
  vpc_id            = aws_vpc.this.id

  tags = {
     Name                                                = var.aws_subnet_application_name
     "kubernetes.io/cluster/${var.aws_eks_cluster_name}" = "shared"
  }
}

# Subnet - Database
resource "aws_subnet" "database" {
  count             = var.subnet_count
  availability_zone = data.aws_availability_zones.available.names[count.index]
  cidr_block        = "10.0.3${count.index}.0/24"
  vpc_id            = aws_vpc.this.id
  
  tags = {
    Name = var.aws_subnet_database_name
  }
}

# Route Table Association - Gateway
resource "aws_route_table_association" "gateway" {
  count          = var.subnet_count
  subnet_id      = aws_subnet.gateway.*.id[count.index]
  route_table_id = aws_route_table.gateway.id
}

# Route Table Association - Application
resource "aws_route_table_association" "application" {
  count          = var.subnet_count
  subnet_id      = aws_subnet.application.*.id[count.index]
  route_table_id = aws_route_table.application.*.id[count.index]
}

# Route Table Association - Database
resource "aws_route_table_association" "database" {
  count          = var.subnet_count
  subnet_id      = aws_subnet.database.*.id[count.index]
  route_table_id = aws_route_table.database.id
}