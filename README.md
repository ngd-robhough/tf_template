# Terraform Starter Template

Basic starter layout for Terraform projects with a workspace-first workflow.

## Goals

- Encourage Terraform workspaces instead of using the default workspace.
- Keep environment-specific values in tfvars files.
- Provide a clean baseline that can be extended for any provider.

## Structure

.
|-- backend/
|   |-- dev.hcl
|   `-- prod.hcl
|-- env/
|   |-- dev.tfvars
|   `-- prod.tfvars
|-- backend.tf
|-- main.tf
|-- providers.tf
|-- variables.tf
|-- outputs.tf
|-- versions.tf
|-- .pre-commit-config.yaml
`-- .gitignore

## Workspace workflow

1. Initialize Terraform with the backend file for your environment.
2. Create and select a workspace.
3. Plan/apply with the tfvars file matching that workspace.

Example using Bash:

terraform init -backend-config="backend/dev.hcl"
terraform workspace new dev || true
terraform workspace select dev
terraform plan -var-file="env/$(terraform workspace show).tfvars"
terraform apply -var-file="env/$(terraform workspace show).tfvars"

Example using PowerShell:

terraform init -backend-config="backend/dev.hcl"
terraform workspace select dev
if ($LASTEXITCODE -ne 0) { terraform workspace new dev }
$ws = terraform workspace show
terraform plan -var-file="env/$ws.tfvars"
terraform apply -var-file="env/$ws.tfvars"

## Notes

- This template intentionally fails if you try to run from the default workspace.
- Add providers, resources, and modules in main.tf as your project grows.
- For additional environments, create another file in env/ named to match the workspace.
- Set aws_region per environment in env/<workspace>.tfvars.
- Optional AWS auth inputs are supported: aws_profile, aws_assume_role_arn, and aws_assume_role_session_name.

## AWS Auth Options

You can choose one of the following patterns per environment tfvars file:

- Base credentials only: set aws_region and rely on your active AWS credentials.
- Shared profile: set aws_profile.
- Assume role: set aws_assume_role_arn (and optionally aws_assume_role_session_name).

If aws_assume_role_session_name is not set, the default is terraform-<workspace>.

## Backend Pattern

Use one backend file per environment and run init with the matching file:

- dev workspace: terraform init -backend-config="backend/dev.hcl"
- prod workspace: terraform init -backend-config="backend/prod.hcl"

Set real values for bucket, region, and dynamodb_table in backend/*.hcl before first use.

## Pre-commit hooks

This template includes a pre-commit configuration that runs:

- terraform fmt
- terraform validate
- tflint
- trivy (Terraform misconfiguration scan)

Install and enable the hook:

Install required tools first:

tflint --version
trivy --version

Then install and enable pre-commit:

pip install pre-commit
pre-commit install

Run against all files:

pre-commit run --all-files
