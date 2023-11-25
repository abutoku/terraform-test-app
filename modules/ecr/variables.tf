locals {
  module = "ecr"
}

variable "environment" {
  description = "environment(dev,stg,prd)"
  validation {
    condition     = contains(["dev", "stg", "prd"], var.environment)
    error_message = "The environment must be dev, stg or prd."
  }
}


variable "name" {
  description = "name"
  type        = string
}

