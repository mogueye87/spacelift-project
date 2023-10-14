variable "aws_region" {
  description = "AWS region where resources will be deployed"
  type        = string
  default     = "us-east-1"
}

variable "profile" {
  description = "AWS profile used"
  type        = string
  default     = "default"
}