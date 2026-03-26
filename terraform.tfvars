aws_region  = "us-east-1"
project     = "demo"
environment = "dev"
lambda_name = "demo-message-processor"

python_runtime = "python3.12"
handler        = "lambda_function.lambda_handler"

# CI creates this zip in internal/build.
lambda_zip_path = "./build/lambda.zip"

env_vars = {
  APP_ENV = "dev"
}

tags = {
  Owner   = "Engineering"
  Project = "Device-Event-Processor"
  Managed = "Terraform"
}
