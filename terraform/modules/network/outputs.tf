output "vpc_name" {
  description = "Name of the VPC"
  value       = var.vpc_name
}

output "vpc_id" {
  description = "ID of the default VPC"
  value       = aws_vpc.default.id
}

output "environment" {
  description = "Deployment environment"
  value       = var.environment
}

output "public_subnet_ids" {
  description = "IDs of public subnets"
  value       = aws_subnet.public-subnets[*].id  # Modern splat syntax
}

output "private_subnet_ids" {
  description = "IDs of private subnets"
  value       = aws_subnet.private-subnets[*].id
}

output "public_subnet_id_1" {
  description = "ID of first public subnet"
  value       = aws_subnet.public-subnets[0].id
  precondition {
    condition     = length(aws_subnet.public-subnets) > 0
    error_message = "No public subnets available."
  }
}

