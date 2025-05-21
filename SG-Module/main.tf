resource "aws_security_group" "ec2" {                             # Security group for EC2 instance
  name        = "${var.tags["Name"]}-${var.service_name}-ec2"     # Name of the security group.
  description = "Security group for EC2 instance"                 # Description of the security group. 
  vpc_id      = var.vpc_id                                        # VPC ID where the security group will be created.  

  ingress {                                                       # Ingress rule for EC2 instance
    from_port   = 80                                              # Port for HTTP (80).
    to_port     = 80                                              # Port for HTTP (80).  
    protocol    = "tcp"                                           # Protocol (TCP).
    cidr_blocks = ["0.0.0.0/0"]                                   # Allow traffic from anywhere.
  }

  ingress {                                                       # Ingress rule for SSH access
    from_port   = 22                                              # Port for SSH (22).
    to_port     = 22                                              # Port for SSH (22).  
    protocol    = "tcp"                                           # Protocol (TCP).
    cidr_blocks = ["0.0.0.0/0"]                                   # Allow traffic from anywhere.
  }

  egress {                                                        # Egress rule for all outbound traffic
    from_port   = 0                                               # Allow all outbound traffic.
    to_port     = 0                                               # Allow all outbound traffic.
    protocol    = "-1"                                            # All protocols.
    cidr_blocks = ["0.0.0.0/0"]                                   # Allow traffic to anywhere. 
  }

  tags = merge(                                                   # Tags for the security group 
    var.tags,                                                     # Merge the tags passed to the module with the security group-specific tags 
    {
      Name = "${var.tags["Name"]}-${var.service_name}-ec2"        # The name of the security group, which is a combination of the Name tag and the service name. 
    }
  )
}

resource "aws_security_group" "rds" {                              # Security group for RDS instance  
  name        = "${var.tags["Name"]}-${var.service_name}-rds"      # Name of the security group.  
  description = "Security group for RDS instance"                  # Description of the security group. 
  vpc_id      = var.vpc_id                                         # VPC ID where the security group will be created.

  ingress {                                                        # Ingress rule for RDS instance                  
    from_port       = 3306                                         # Port for MySQL (3306).
    to_port         = 3306                                         # Port for MySQL (3306).
    protocol        = "tcp"                                        # Protocol (TCP).
    security_groups = [aws_security_group.ec2.id]                  # Security group ID for EC2 instance.
  }

  tags = merge(                                                    # Tags for the security group
    var.tags,                                                      # Merge the tags passed to the module with the security group-specific tags 
    {
      Name = "${var.tags["Name"]}-${var.service_name}-rds"         # The name of the security group, which is a combination of the Name tag and the service name.
    }
  )
} 