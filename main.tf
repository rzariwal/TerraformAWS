#-------------------------------
# AWS Provider
#-------------------------------
provider "aws" {
  region = "ap-southeast-1"
}

#-------------------------------
# VPC resource
#-------------------------------
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "my-terraform-aws-vpc-${terraform.workspace}"
    Environment = "${terraform.workspace}"
  }
}

#-------------------------------
# S3 Bucket Creation
#-------------------------------
resource "aws_s3_bucket" "my-bucket" {
  bucket = "my-terraform-bucket-terraform-state"
  acl = "private"
  versioning {
    enabled = true
  }
  
  tags = {
    Name = "my-terraform-bucket-terraform-state"
  }
}

#-------------------------------
# S3 Remote State
#-------------------------------
terraform {
  backend "s3" {
    bucket = "my-terraform-bucket-terraform-state"
    key    = "vpc.tfstate"
    region = "ap-southeast-1"
  }
}

resource "aws_subnet" "public_subnet" {
  count      = "${length(var.public_subnet_cidr_block)}"

  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${element(var.public_subnet_cidr_block, count.index)}"

  availability_zone = "${element(var.availability_zones, count.index)}"

  tags = {
    Name = "public_subnet_${count.index}"
  }
}

resource "aws_subnet" "private_subnet" {
  count      = "${length(var.private_subnet_cidr_block)}"

  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${element(var.private_subnet_cidr_block, count.index)}"

  availability_zone = "${element(var.availability_zones, count.index)}"

  tags = {
    Name = "private_subnet_${count.index}"
  }
}

resource "aws_subnet" "database_subnet" {
  count      = "${length(var.database_subnet_cidr_block)}"

  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${element(var.database_subnet_cidr_block, count.index)}"

  availability_zone = "${element(var.availability_zones, count.index)}"

  tags = {
    Name = "database_subnet_${count.index}"
  }
}
