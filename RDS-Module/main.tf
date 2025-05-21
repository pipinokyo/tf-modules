resource "aws_db_instance" "this" {                                   # RDS instance resource
  identifier           = "${var.tags["Name"]}-${var.service_name}"    # Instance identifier, combining the Name tag and service name. in this case, it is "wordpress-rds"
  engine              = "mysql"                                       # Database engine type (MySQL in this case).
  engine_version      = "5.7"                                         # Version of the database engine.
  instance_class      = var.instance_class                            # Instance class (e.g., db.t3.micro). 
  allocated_storage   = 20                                            # Allocated storage size in GiB.
  storage_type        = "gp2"                                         # Storage type (General Purpose SSD).

  db_name             = var.db_name                                   # Database name.
  username            = var.db_username                               # Database username.
  password            = var.db_password                               # Database password.
  
  db_subnet_group_name   = var.db_subnet_group                        # Subnet group for the database instance.
  vpc_security_group_ids = [var.security_group_id]                    # Security group IDs to associate with the instance.
  
  skip_final_snapshot    = true                                       # Skip final snapshot on deletion. 
  publicly_accessible    = true                                       # Make the instance publicly accessible. 
  
  tags = merge(var.tags, {                                            # Merge the tags passed to the module with the instance-specific tags
    Name = "${var.tags["Name"]}-${var.service_name}"                  # The name of the instance, which is a combination of the Name tag and the service name. in this case, it is "wordpress-rds"
  })
} 