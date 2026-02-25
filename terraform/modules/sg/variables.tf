variable "vpc_name" {
  description = "Unique name/prefix for VPC resources (e.g., 'myapp-vpc')"
  type        = string
}

variable "environment" {
  description = "Deployment environment (dev, staging, prod)"
  type        = string
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Must be one of: dev, staging, prod."
  }
}

variable "service_ports" {
  description = "List of service ports for security groups/load balancer listeners (e.g., [80, 443, 8080])"
  type        = list(number)
  validation {
    condition     = alltrue([for port in var.service_ports : port >= 1 && port <= 65535])
    error_message = "Ports must be between 1-65535."
  }
}

variable "vpc_id" {
  description = "Existing VPC ID (e.g., vpc-0abcd1234efgh5678)"
  type        = string
  validation {
    condition     = can(regex("^vpc-[0-9a-f]{8,17}$", var.vpc_id))
    error_message = "Must be valid AWS VPC ID format (vpc-XXXXXXXXX)."
  }
}
