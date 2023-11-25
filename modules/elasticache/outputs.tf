output "primary_endpoint" {
  description = "The primary endpoint of the ElastiCache cluster"
  value       = aws_elasticache_cluster.main.cache_nodes[0].address
}
