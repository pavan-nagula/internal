module "lambda" {
  source = "git::https://github.com/pavan-nagula/module-lambda.git//terraform-cts-umb-module-lambda-main?ref=main"

  project      = var.project
  environment  = var.environment
  lambda_name  = var.lambda_name

  python_runtime   = var.python_runtime
  handler          = var.handler
  lambda_zip_path  = var.lambda_zip_path
  timeout_seconds  = var.timeout_seconds
  memory_mb        = var.memory_mb
  log_retention_days = var.log_retention_days

  env_vars = var.env_vars

  subnet_ids          = var.subnet_ids
  security_group_ids  = var.security_group_ids
  iam_roles_path      = var.iam_roles_path
  enable_xray_tracing = var.enable_xray_tracing

  enable_eventbridge_trigger = false
  enable_msk_trigger         = false

  tags = var.tags
}
