resource "aws_security_group" "velocity_ec2" {

  name = "${var.application_name}-sg"

  description = "Security group for Velocity provisioned EC2 instance"

  vpc_id = data.aws_vpc.default.id

  dynamic "ingress" {

    for_each = var.ssh_cidr == "" ? [] : [var.ssh_cidr]

    content {
      description = "SSH"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = [ingress.value]
    }
  }

  egress {
    description = "Allow outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.application_name}-sg"
    ManagedBy   = "Velocity"
    Application = var.application_name
    Environment = var.environment
  }
}


resource "aws_instance" "application" {

  ami = data.aws_ssm_parameter.amazon_linux.value

  instance_type = var.instance_type

  subnet_id = data.aws_subnets.default.ids[0]

  vpc_security_group_ids = [
    aws_security_group.velocity_ec2.id
  ]

  associate_public_ip_address = true

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  tags = {
    Name        = var.application_name
    ManagedBy   = "Velocity"
    Application = var.application_name
    Owner       = var.application_owner
    Team        = var.team
    Environment = var.environment
    Service     = "EC2"
  }
}