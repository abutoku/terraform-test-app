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

variable "vpc_cidr_block" {
  description = "vpc cidr block"
  type        = string
}

variable "public_subnet" {
  description = "public subnet"
  type        = map(any) #map型で受け取る
}

variable "private_subnet" {
  description = "private subnet"
  type        = map(any) #map型で受け取る
}

variable "restrict_subnet" {
  description = "restrict subnet"
  type        = map(any) #map型で受け取る
}
