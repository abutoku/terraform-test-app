# vpc
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block #variableで受け取る
  enable_dns_support   = true
  enable_dns_hostnames = true
  instance_tenancy     = "default"

  tags = {
    Name = "${var.name}-vpc"
  }
}