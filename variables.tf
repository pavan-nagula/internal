variable "lambda" {
  description = "Map of Lambda functions"
  type = map(object({
    project                    = string
    environment                = string
    lambda_name                = string
    python_runtime             = optional(string, "python3.12")
    handler                    = optional(string, "lambda_function.lambda_handler")
    lambda_zip_path            = string
    timeout_seconds            = optional(number, 300)
    memory_mb                  = optional(number, 256)
    iam_roles_path             = optional(string, "/")
    env_vars                   = optional(map(string), {})
    log_retention_days         = optional(number, 14)
    enable_eventbridge_trigger = optional(bool, false)
    schedule_expression        = optional(string, "rate(5 minutes)")
    enable_xray_tracing        = optional(bool, false)
  }))
  default = {}
}
