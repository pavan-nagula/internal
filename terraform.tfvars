lambda = {
  "device-event-processing" = {
    project         = "Device-Event-Processing"
    environment     = "boil"
    lambda_name     = "device-event-processing-lambda"
    python_runtime  = "python3.12"
    handler         = "lambda_function.lambda_handler"
    lambda_zip_path = "./lambda_function.zip"
    timeout_seconds = 300
    memory_mb       = 256
    iam_roles_path  = "/deviceeventprocessinglambda/"
    env_vars = {
      LOG_LEVEL = "INFO"
    }
    log_retention_days         = 90
    enable_eventbridge_trigger = true
    schedule_expression        = "rate(5 minutes)"
    enable_xray_tracing        = false
  }
}
