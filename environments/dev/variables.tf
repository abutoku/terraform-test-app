locals {
  environment = "dev"
  app_name    = "demo"

  main_vpc = {
    name           = "${local.app_name}-${local.environment}"
    vpc_cidr_block = "10.1.0.0/16"
    public_subnet = {
      "ap-northeast-1a" = "10.1.0.0/24"
      "ap-northeast-1c" = "10.1.16.0/24"
    }
    private_subnet = {
      "ap-northeast-1a" = "10.1.1.0/24"
      "ap-northeast-1c" = "10.1.17.0/24"
    }
    restrict_subnet = {
      "ap-northeast-1a" = "10.1.2.0/24"
      "ap-northeast-1c" = "10.1.18.0/24"
    }
    # single_nat_gateway = true
  }
}