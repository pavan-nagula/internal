module "lambda" {
  source = "git::https://github.com/pavan-nagula/module-lambda.git//terraform-cts-umb-module-lambda-main?ref=main"

  
  for_each    = var.lambda
  project     = each.value.project
  environment = each.value.environment
  lambda_name = each.value.lambda_name

  # Lambda configuration
  python_runtime  = each.value.python_runtime
  handler         = each.value.handler
  lambda_zip_path = each.value.lambda_zip_path
  timeout_seconds = each.value.timeout_seconds
  memory_mb       = each.value.memory_mb
  iam_roles_path  = each.value.iam_roles_path
  env_vars = merge(
    each.value.env_vars
  )
  log_retention_days = each.value.log_retention_days

  # EventBridge scheduled trigger
  enable_eventbridge_trigger = try(each.value.enable_eventbridge_trigger, false)
  schedule_expression        = try(each.value.schedule_expression, "rate(5 minutes)")

  # X-Ray tracing
  enable_xray_tracing = try(each.value.enable_xray_tracing, false)
}
