variable "environment" {
  description = "Deployment environment (dev, staging, prod)"
  type        = string
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Must be: dev, staging, or prod."
  }
}

variable "rolename" {
  description = "IAM role name (e.g., myapp-ec2-role)"
  type        = string
}

variable "instanceprofilename" {
  description = "IAM instance profile name (e.g., myapp-ec2-profile)"
  type        = string
  validation {
    condition     = length(var.instanceprofilename) <= 64
    error_message = "Instance profile name must be ≤64 characters."
  }
}
