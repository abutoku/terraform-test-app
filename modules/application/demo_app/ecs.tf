resource "aws_ecs_service" "main" {
  name    = "${local.name}-service"
  cluster = var.ecs_cluster_arn

  load_balancer {
    target_group_arn = aws_lb_target_group.main.arn
    container_name   = local.container_name
    container_port   = 80
  }

  desired_count                      = 3
  launch_type                        = "FARGATE"
  platform_version                   = "LATEST"
  task_definition                    = aws_ecs_task_definition.main.arn
  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 100
  enable_ecs_managed_tags            = true

  network_configuration {
    security_groups = [
      aws_security_group.service.id
    ]
    subnets = var.private_subnet_ids
  }

  health_check_grace_period_seconds = 0
  scheduling_strategy               = "REPLICA"

  service_registries {
    registry_arn = aws_service_discovery_service.main.arn
  }

  lifecycle {
    ignore_changes = [task_definition]
  }

  tags = {
    Name   = "${local.name}-service"
    Module = local.module
  }
}

