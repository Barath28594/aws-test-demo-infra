output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.application.id
}

output "instance_public_ip" {
  description = "EC2 public IP"
  value       = aws_instance.application.public_ip
}

output "instance_private_ip" {
  description = "EC2 private IP"
  value       = aws_instance.application.private_ip
}

output "instance_type" {
  description = "EC2 instance type"
  value       = aws_instance.application.instance_type
}

output "security_group_id" {
  description = "Security group ID"
  value       = aws_security_group.velocity_ec2.id
}