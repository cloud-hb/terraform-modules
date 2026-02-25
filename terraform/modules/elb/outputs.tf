output "elb_listener" {
  description = "ARN of the ALB listener"
  value       = aws_lb_listener.front_end.arn  # Use ARN over ID
}