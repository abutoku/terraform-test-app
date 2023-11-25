resource "aws_security_group" "alb" {
  name        = "${local.name}-alb-sg"
  description = "security group for ${local.name}-alb"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.alb_allow_ips

    content {
      description = ingress.key
      from_port   = "443"
      to_port     = "443"
      protocol    = "tcp"
      cidr_blocks = ingress.value
    }
  }

  egress {
    description = "egress all"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name   = "${local.name}-alb-sg"
    Module = local.module
  }
}

resource "aws_security_group" "service" {
  name        = "${local.name}-service-sg"
  description = "security group for ${local.name}-service"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTP from alb"
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    security_groups = [
      aws_security_group.alb.id
    ]
  }

  egress {
    description = "egress all"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name   = "${local.name}-service-sg"
    Module = local.module
  }
}
