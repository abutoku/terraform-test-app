resource "aws_security_group" "redis_cluster" {
  name        = "${local.app_name}-${local.environment}-redis-sg"
  description = "security group for ${local.app_name}-${local.environment}-redis-cluster"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "from bastion"
    from_port   = "6379"
    to_port     = "6379"
    protocol    = "tcp"
    cidr_blocks = ["172.31.0.0/16"]
  }

  ingress {
    description = "${local.app_name}-${local.environment}-vpc private subnet"
    from_port   = "6379"
    to_port     = "6379"
    protocol    = "tcp"
    cidr_blocks = values(local.main_vpc.private_subnet)
  }

  egress {
    description = "egress all"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${local.app_name}-${local.environment}-redis-sg"
  }
}