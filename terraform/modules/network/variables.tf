variable "vpc_cidr" {
  description = "CIDR block for VPC (e.g., 10.0.0.0/16)"
  type        = string
  validation {
    condition     = can(cidrhost(var.vpc_cidr, 0))
    error_message = "Must be valid CIDR block."
  }
}

variable "vpc_name" {
  description = "VPC name prefix (e.g., myapp)"
  type        = string
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Must be: dev, staging, or prod."
  }
}

variable "public_cidr_block" {
  description = "Public subnet CIDRs (e.g., ['10.0.1.0/24', '10.0.2.0/24'])"
  type        = list(string)
  validation {
    condition     = alltrue([for cidr in var.public_cidr_block : can(cidrhost(cidr, 0))])
    error_message = "All public CIDRs must be valid."
  }
}

variable "private_cidr_block" {
  description = "Private subnet CIDRs (e.g., ['10.0.101.0/24', '10.0.102.0/24'])"
  type        = list(string)
  validation {
    condition     = alltrue([for cidr in var.private_cidr_block : can(cidrhost(cidr, 0))])
    error_message = "All private CIDRs must be valid."
  }
}

variable "azs" {
  description = "Availability Zones (e.g., ['us-east-1a', 'us-east-1b'])"
  type        = list(string)
  validation {
    condition     = length(var.azs) >= 2 && length(var.azs) <= 6
    error_message = "Must use 2-6 AZs."
  }
}

variable "natgw_id" {
  description = "NAT Gateway ID (e.g., nat-0abcd1234efgh5678)"
  type        = string
  validation {
    condition     = can(regex("^nat-[0-9a-f]{8,17}$", var.natgw_id))
    error_message = "Must be valid NAT Gateway ID format."
  }
}
