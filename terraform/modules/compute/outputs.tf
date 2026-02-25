output "private_servers" {
  description = "IDs of private EC2 instances"
  value       = aws_instance.private-servers[*].id
}

output "public_servers" {
  description = "IDs of public EC2 instances"
  value       = aws_instance.public-servers[*].id
}
