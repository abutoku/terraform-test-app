locals {
  name           = "${var.environment}-${var.basename}"
  module         = "demo-app"
  container_name = "${local.name}-container"
}

variable "environment" {
  description = "environment(dev,stg,prd)"
  validation {
    condition     = contains(["dev", "stg", "prd"], var.environment)
    error_message = "The environment must be dev, stg or prd."
  }
}

variable "basename" {
  description = "basename"
  type        = string
}

variable "vpc_id" {
  description = "vpc id"
  type        = string
}

# variable "alb_log_bucket" {
#   description = "alb log bucket"
#   type        = string
# }

variable "public_subnet_ids" {
  description = "subnet ids for external alb"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "subnet ids for application and internal alb"
  type        = list(string)
}

# variable "app_domain" {
#   description = "application domain name"
#   type        = string
# }

variable "ecs_cluster_arn" {
  description = "ecs cluster arn"
  type        = string
}

variable "alb_allow_ips" {
  description = "ip maps allowed to access by alb"
  type        = map(any)
}

variable "task_role_arn" {
  description = "task role for ESC Task"
  type        = string
}

variable "task_execution_role_arn" {
  description = "task execution role for ECS Task"
  type        = string
}

# variable "zone_id" {
#   description = "route53 zone id"
#   type        = string
# }

variable "alb_dns_routing_weight" {
  description = "alb dns routing weight"
  type        = number
  default     = 0
}

# variable "cloudmap_namespace_id" {
#   description = "cloudmap namespace id"
#   type        = string
# }
