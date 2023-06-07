terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

provider "aws" {
  region = var.vpc_vars.region
  # access_key = "${var.aws_access_key}"
  # secret_key = "${var.aws_secret_key}"
}

#Create the VPC
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_vars.cidr
  enable_dns_hostnames = true
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.vpc_vars.subnet
  availability_zone = var.vpc_vars.az
}

# Define the internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id
}

# Define the public route table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = var.vpc_vars.rt_cidr
    gateway_id = aws_internet_gateway.gw.id
  }
}
# Assign the public route table to the public subnet
resource "aws_route_table_association" "public_rt_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}


resource "aws_instance" "nodes" {
  for_each      = var.instances
  instance_type = each.value.instance_type
  ami           = each.value.ami
  key_name      = each.value.key_name

  tags = {
    Name        = each.key
    Application = each.value.env
  }
}