output "arn" {
  description = "ecs cluster arn"
  value       = aws_ecs_cluster.main.arn
}

output "name" {
  description = "ecs cluster name"
  value = aws_ecs_cluster.main.name
}