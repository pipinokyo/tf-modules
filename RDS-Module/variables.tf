variable "db_name" {
  description = "Name of the database"
  type        = string
}

variable "db_username" {
  description = "Username for the database"
  type        = string
}

variable "db_password" {
  description = "Password for the database"
  type        = string
  sensitive   = true
}

variable "instance_class" {
  description = "Instance class for the RDS instance"
  type        = string
  default     = "db.t3.micro"
}

variable "db_subnet_group" {
  description = "Name of the DB subnet group"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID for the RDS instance"
  type        = string
}

variable "service_name" {
  description = "Service name (e.g., ec2, rds, sg)"
  type        = string
  default     = "rds"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
} 