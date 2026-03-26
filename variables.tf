variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
  default     = "us-east-1"
}

variable "project" {
  description = "Project/system name prefix"
  type        = string
  default     = "cubic"
}

variable "environment" {
  description = "Environment name (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "lambda_name" {
  description = "Lambda function name"
  type        = string
  default     = "cubic-message-processor"
}

variable "python_runtime" {
  description = "Python runtime for Lambda"
  type        = string
  default     = "python3.12"
}

variable "handler" {
  description = "Lambda handler (file.function)"
  type        = string
  default     = "lambda_function.lambda_handler"
}

variable "lambda_zip_path" {
  description = "Path to Lambda deployment zip"
  type        = string
  default     = "${path.module}/build/lambda.zip"
}

variable "timeout_seconds" {
  description = "Lambda timeout in seconds"
  type        = number
  default     = 120
}

variable "memory_mb" {
  description = "Lambda memory in MB"
  type        = number
  default     = 256
}

variable "log_retention_days" {
  description = "CloudWatch log retention in days"
  type        = number
  default     = 14
}

variable "env_vars" {
  description = "Environment variables for Lambda"
  type        = map(string)
  default = {
    APP_ENV = "dev"
  }
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default = {
    Owner   = "Engineering"
    Project = "Cubic-Lambda"
    Managed = "Terraform"
  }
}

variable "subnet_ids" {
  description = "Subnet IDs for VPC-enabled Lambda"
  type        = list(string)
  default     = []
}

variable "security_group_ids" {
  description = "Security Group IDs for VPC-enabled Lambda"
  type        = list(string)
  default     = []
}

variable "iam_roles_path" {
  description = "IAM roles path"
  type        = string
  default     = "/"
}

variable "enable_xray_tracing" {
  description = "Enable X-Ray tracing"
  type        = bool
  default     = false
}
