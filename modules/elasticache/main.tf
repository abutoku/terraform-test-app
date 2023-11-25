# resource "aws_elasticache_replication_group" "main" {
#   replication_group_id   = "${var.name}-redis-cluster"
#   engine                 = "redis"
#   engine_version         = "7.0"
#   node_type              = "cache.t4g.micro"
#   multi_az_enabled       = true
#   num_cache_clusters     = 2
#   parameter_group_name   = "default.redis7.cluster.on"
#   port                   = 6379
#   subnet_group_name      = var.subnet_group_name
#   security_group_ids     = var.security_group_ids
#   description                    = "${var.name}-redis-cluster"
#   automatic_failover_enabled     = true
# }

resource "aws_elasticache_cluster" "main" {
  cluster_id             = "${var.name}"
  engine                 = "redis"
  engine_version         = "7.0"
  node_type              = "cache.t4g.micro"
  parameter_group_name   = "default.redis7"
  num_cache_nodes        = 1
  # num_cache_nodes        = var.num_cache_nodes
  port                   = 6379
  subnet_group_name      = var.subnet_group_name
  security_group_ids     = var.security_group_ids
}
