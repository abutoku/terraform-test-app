output "service_security_group_id" {
  description = "security group id for ECS Service"
  value       = aws_security_group.service.id
}

output "service_id" {
  description = "ECS service arn"
  value       = aws_ecs_service.main.id
}
