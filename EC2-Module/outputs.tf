output "public_ip" {                                 # Output for EC2 instance public IP
  description = "Public IP of the EC2 instance"      # 
  value       = aws_instance.this.public_ip          # The public IP address of the EC2 instance. This is a computed attribute.
}

output "instance_id" {                               # Output for EC2 instance ID
  description = "ID of the EC2 instance"
  value       = aws_instance.this.id                 # The ID of the EC2 instance. This is a computed attribute.
} 