variable "vpc_id" {
  description = "VPC ID where the security groups will be created"
  type        = string
}

variable "service_name" {
  description = "Service name (e.g., ec2, rds, sg)"
  type        = string
  default     = "sg"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
} 