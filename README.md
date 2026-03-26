# Lambda Deployment (Terraform Caller)

This folder calls the module from:

- `git::https://github.com/pavan-nagula/module-lambda.git//terraform-cts-umb-module-lambda-main?ref=main`

Scope:

- Deploys AWS Lambda function
- Creates Lambda IAM execution role and CloudWatch log group
- Does **not** configure EventBridge trigger in this stack

## Local Run

1. Build Lambda zip:

```powershell
New-Item -ItemType Directory -Force -Path .\build | Out-Null
Compress-Archive -Path .\lambda_src\* -DestinationPath .\build\lambda.zip -Force
```

2. Terraform:

```powershell
terraform init
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars" -auto-approve
```

3. Smoke test invoke:

```powershell
$functionName = terraform output -raw lambda_name
aws lambda invoke --function-name $functionName --payload '{"ping":"true"}' --cli-binary-format raw-in-base64-out response.json
Get-Content response.json
```
