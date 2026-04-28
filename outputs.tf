output "workspace" {
  description = "The active Terraform workspace."
  value       = terraform.workspace
}

output "environment" {
  description = "Effective environment name after workspace fallback."
  value       = local.effective_environment
}

output "common_tags" {
  description = "Computed common tags/labels for resources."
  value       = local.common_tags
}
