#-------------------------------
# AWS Provider
#-------------------------------
provider "aws" {
  region = "ap-southeast-1"
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
