output "lambda_name" {
  value       = module.lambda["device-event-processing"].lambda_name
  description = "Lambda function name"
}

output "lambda_arn" {
  value       = module.lambda["device-event-processing"].lambda_arn
  description = "Lambda ARN"
}

output "lambda_role_name" {
  value       = module.lambda["device-event-processing"].lambda_role_name
  description = "Lambda IAM role name"
}

output "lambda_role_arn" {
  value       = module.lambda["device-event-processing"].lambda_role_arn
  description = "Lambda IAM role ARN"
}
