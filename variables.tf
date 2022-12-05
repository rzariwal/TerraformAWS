variable "aws_region" {
  description = "AWS Region"
  default = "ap-southeast-1"
}
variable "vpc_cidr_block" {
  description = "Main VPC CIDR Block"
  default = "10.0.0.0/16"
}
variable "availability_zones" {
  type = "list"
  description = "AWS Region Availability Zones"
  default = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
}
variable "public_subnet_cidr_block" {
  type = "list"
  description = "Public Subnet CIDR Block"
  public_subnet_cidr_block = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
}
variable "private_subnet_cidr_block" {
  type = "list"
  description = "Private Subnet CIDR Block"
  default = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}
variable "database_subnet_cidr_block" {
  type = "list"
  description = "Database Subnet CIDR Block"
  default = ["10.0.201.0/24", "10.0.202.0/24", "10.0.203.0/24"]
}