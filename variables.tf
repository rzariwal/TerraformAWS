variable "aws_region" {
  description = "AWS Region"
  default = "ap-southeast-1"
}
variable "vpc_cidr_block" {
  description = "Main VPC CIDR Block"
  default = "10.0.0.0/16"
}