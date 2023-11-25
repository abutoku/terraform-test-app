terraform {
  required_version = "1.2.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.20.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = "ap-northeast-1"
  access_key = "AWS_ACCESS_KEY_ID"
  secret_key = "AWS_SECRET_ACCESS_KEY"

  default_tags {
    tags = {
      Terraform = "true"
    }
  }
}
