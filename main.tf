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
