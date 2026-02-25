variable "public_subnet_id" {
  description = "ID of public subnet (e.g., subnet-0abcd1234efgh5678)"
  type        = string
  validation {
    condition     = can(regex("^subnet-[0-9a-f]{8,17}$", var.public_subnet_id))
    error_message = "Must be valid AWS subnet ID format (subnet-XXXXXXXXX)."
  }
}

variable "vpc_name" {
  description = "VPC name prefix for resource naming (e.g., myapp)"
  type        = string
}
