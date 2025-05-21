resource "aws_security_group" "ec2" {
  name        = "${var.tags["Name"]}-${var.service_name}-ec2"
  description = "Security group for EC2 instance"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.tags["Name"]}-${var.service_name}-ec2"
    }
  )
}

resource "aws_security_group" "rds" {
  name        = "${var.tags["Name"]}-${var.service_name}-rds"
  description = "Security group for RDS instance"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.ec2.id]
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.tags["Name"]}-${var.service_name}-rds"
    }
  )
} 