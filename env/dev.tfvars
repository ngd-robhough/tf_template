project_name = "my-project"
aws_region   = "us-east-1"

# Optional AWS auth settings:
# aws_profile                  = "dev-sso"
# aws_assume_role_arn          = "arn:aws:iam::111122223333:role/terraform-deployer"
# aws_assume_role_session_name = "tf-dev"

tags = {
  owner       = "platform-team"
  environment = "dev"
}
