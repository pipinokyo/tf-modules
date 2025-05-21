variable "vpc_id" {
  description = "VPC ID where the security groups will be created"
  type        = string
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
} 