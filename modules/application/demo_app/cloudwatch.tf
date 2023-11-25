resource "aws_cloudwatch_log_group" "main" {
  name = "/ecs/${local.container_name}"
  tags = {
    Name   = "${local.container_name}-log-group"
    Module = local.module
  }
}