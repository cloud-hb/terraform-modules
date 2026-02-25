variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region where resources will be created"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC (e.g., 10.0.0.0/16)"
  type        = string
  validation {
    condition     = can(cidrhost(var.vpc_cidr, 0))
    error_message = "Must be a valid CIDR block."
  }
}

variable "vpc_name" {
  description = "Unique name/prefix for VPC resources"
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g., dev, staging, prod)"
  type        = string
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Must be dev, staging, or prod."
  }
}

variable "public_cidr_block" {
  description = "CIDR blocks for public subnets (list of strings)"
  type        = list(string)
  validation {
    condition     = alltrue([for cidr in var.public_cidr_block : can(cidrhost(cidr, 0))])
    error_message = "All public CIDRs must be valid."
  }
}

variable "private_cidr_block" {
  description = "CIDR blocks for private subnets (list of strings)"
  type        = list(string)
  validation {
    condition     = alltrue([for cidr in var.private_cidr_block : can(cidrhost(cidr, 0))])
    error_message = "All private CIDRs must be valid."
  }
}

variable "azs" {
  description = "List of Availability Zones (e.g., [\"us-east-1a\", \"us-east-1b\"])"
  type        = list(string)
}
