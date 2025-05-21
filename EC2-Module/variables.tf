variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Type of instance to create"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Key pair name for EC2"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
}

variable "service_name" {
  description = "Service name (e.g., ec2, rds, sg)"
  type        = string
  default     = "ec2"
}

variable "tags" {                                               # A map of tags to apply to all resources
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
} 