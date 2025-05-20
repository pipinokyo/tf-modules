output "endpoint" {
  description = "RDS endpoint"
  value       = aws_db_instance.wordpress.endpoint
}

output "db_name" {
  description = "Database name"
  value       = aws_db_instance.wordpress.name
} 