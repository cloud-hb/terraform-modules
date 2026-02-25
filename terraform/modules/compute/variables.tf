variable "environment" {
  description = "Deployment environment (dev, staging, prod)"
  type        = string
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Must be: dev, staging, or prod."
  }
}

variable "amis" {
  description = "List of AMIs for different instance types/regions"
  type        = list(string)
}

variable "aws_region" {
  description = "AWS region (e.g., us-east-1)"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type (e.g., t3.micro)"
  type        = string
}

variable "key_name" {
  description = "EC2 Key Pair name for SSH access"
  type        = string
}

variable "public_subnets" {
  description = "Public subnet IDs for public EC2 instances"
  type        = list(string)
  validation {
    condition     = alltrue([for subnet in var.public_subnets : can(regex("^subnet-[0-9a-f]{8,17}$", subnet))])
    error_message = "All must be valid subnet IDs."
  }
}

variable "private_subnets" {
  description = "Private subnet IDs for private EC2 instances"
  type        = list(string)
  validation {
    condition     = alltrue([for subnet in var.private_subnets : can(regex("^subnet-[0-9a-f]{8,17}$", subnet))])
    error_message = "All must be valid subnet IDs."
  }
}

variable "sg_id" {
  description = "Security Group ID for EC2 instances"
  type        = string
  validation {
    condition     = can(regex("^sg-[0-9a-f]{8,17}$", var.sg_id))
    error_message = "Must be valid Security Group ID."
  }
}

variable "vpc_name" {
  description = "VPC name prefix for resource naming"
  type        = string
}

variable "elb_listener" {
  description = "Private ELB listener port/protocol (e.g., 80/TCP)"
  type        = string
}

variable "iam_instance_profile" {
  description = "IAM instance profile name or ARN"
  type        = string
}

variable "elb_listener_public" {
  description = "Public ELB listener port/protocol (e.g., 443/TCP)"
  type        = string
}
