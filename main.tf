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
    Name = "my-terraform-aws-vpc"
  }
}
