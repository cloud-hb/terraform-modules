variable "environment" {
  description = "Deployment environment (dev, staging, prod)"
  type        = string
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Must be: dev, staging, or prod."
  }
}

variable "nlbname" {
  description = "Network Load Balancer name (e.g., myapp-nlb)"
  type        = string
}

variable "subnets" {
  description = "List of subnet IDs for NLB (must be public subnets)"
  type        = list(string)
  validation {
    condition     = alltrue([for subnet in var.subnets : can(regex("^subnet-[0-9a-f]{8,17}$", subnet))])
    error_message = "All subnets must be valid AWS subnet IDs."
  }
}

variable "tgname" {
  description = "Target Group name (e.g., myapp-tg)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for NLB and target groups"
  type        = string
  validation {
    condition     = can(regex("^vpc-[0-9a-f]{8,17}$", var.vpc_id))
    error_message = "Must be valid AWS VPC ID format."
  }
}

variable "private_servers" {
  description = "Private server instance IDs for target group registration"
  type        = list(string)
  validation {
    condition     = alltrue([for id in var.private_servers : can(regex("^i-[0-9a-f]{8,17}$", id))])
    error_message = "All must be valid EC2 instance IDs."
  }
}
