variable "db_name" {
  description = "Name of the database to create"
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
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "db_subnet_group" {
  description = "Subnet group for the RDS instance"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID for the RDS instance"
  type        = string
} 