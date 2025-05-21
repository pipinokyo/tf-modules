resource "aws_db_instance" "this" {
  identifier           = "${var.tags["Name"]}-${var.service_name}"
  engine              = "mysql"
  engine_version      = "5.7"
  instance_class      = var.instance_class
  allocated_storage   = 20
  storage_type        = "gp2"
  
  db_name             = var.db_name
  username            = var.db_username
  password            = var.db_password
  
  db_subnet_group_name   = var.db_subnet_group
  vpc_security_group_ids = [var.security_group_id]
  
  skip_final_snapshot    = true
  publicly_accessible    = true
  
  tags = merge(var.tags, {
    Name = "${var.tags["Name"]}-${var.service_name}"
  })
} 