provider "aws" {
    region = "us-east-1"
}

# Create a VPC
resource "aws_vpc" "dev_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name        = var.vpc-name
    Env         = var.tag-env
    Project     = var.tag-project
    Company     = var.company
    Version     = var.config_version
  }
}

# Create a Public Subnet
resource "aws_subnet" "pub-sn-1" {
  vpc_id                  = aws_vpc.dev_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name        = var.public-subnet-name
    Env         = var.tag-env
    Project     = var.tag-project
    Company     = var.company
    Version     = var.config_version
  }
}

# Create a Private Subnet
resource "aws_subnet" "prv-sn-2" {
  vpc_id     = aws_vpc.dev_vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name        = var.private-subnet-name
    Env         = var.tag-env
    Project     = var.tag-project
    Company     = var.company
    Version     = var.config_version
  }
}

# Create an Internet Gateway
resource "aws_internet_gateway" "gw-1" {
  vpc_id = aws_vpc.dev_vpc.id

  tags = {
    Name        = var.internet-gateway-name
    Env         = var.tag-env
    Project     = var.tag-project
    Company     = var.company
    Version     = var.config_version
  }
}

# Create a Route Table
resource "aws_route_table" "rt-1" {
  vpc_id = aws_vpc.dev_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw-1.id
  }

  tags = {
    Name        = var.route-table-name
    Env         = var.tag-env
    Project     = var.tag-project
    Company     = var.company
    Version     = var.config_version
  }
}

# Associate the Public Subnet to the Route Table
resource "aws_route_table_association" "rt-pub-sn-associate" {
  subnet_id      = aws_subnet.pub-sn-1.id
  route_table_id = aws_route_table.rt-1.id
}
