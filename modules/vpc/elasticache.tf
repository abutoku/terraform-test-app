resource "aws_elasticache_subnet_group" "main" {
  description = "redis subnet group for ${var.name}"
  name        = "${var.name}-redis-subnet"
  subnet_ids  = [for x in aws_subnet.restrict : x.id]

  tags = {
    Name   = "${var.name}-redis-subnet"
  }
}
