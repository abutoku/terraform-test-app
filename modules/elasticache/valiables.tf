variable "name" {
  description = "name"
  type        = string
}

variable "environment" {
  description = "environment(dev,stg,prd)"
  validation {
    condition     = contains(["dev", "stg", "prd"], var.environment)
    error_message = "The environment must be dev, stg or prd."
  }
}

variable "subnet_group_name" {
  description = "The subnet group name for the ElastiCache replication group."
  type        = string
}

variable "security_group_ids" {
  description = "The security group ids for the ElastiCache replication group."
  type        = list(string)
}

# variable "num_cache_nodes" {
#   description = "Number of cache nodes for the ElastiCache cluster"
#   type        = number
#   default     = 1 
# }