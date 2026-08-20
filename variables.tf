variable "aws_region" {
  description = "AWS region where the application will be deployed"
  type        = string
  default     = "ap-south-1"
}

variable "application_name" {
  description = "Application name"
  type        = string
  default     = "aws-test-demo"
}

variable "application_owner" {
  description = "Application owner"
  type        = string
  default     = "barath"
}

variable "team" {
  description = "Application team"
  type        = string
  default     = "gisocc"
}

variable "environment" {
  description = "Application environment"
  type        = string
  default     = "dev"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ssh_cidr" {
  description = "CIDR allowed to access SSH. Empty disables SSH ingress."
  type        = string
  default     = ""
}