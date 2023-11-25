resource "aws_ecs_cluster" "main" {
  name = "${var.name}-cluster"

  capacity_providers = [
    "FARGATE",
    "FARGATE_SPOT",
  ]

  tags = {
    Name   = "${var.name}-cluster"
    Module = local.module
  }
}