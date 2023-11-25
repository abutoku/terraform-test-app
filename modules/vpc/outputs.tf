output "vpc_id" {
  value       = aws_vpc.main.id
  description = "vpc id"
}

output "elasticache_subnet_group" {
  value       = aws_elasticache_subnet_group.main.name
  description = "elasticache subnet group name"
}