locals {
  effective_environment = coalesce(var.environment, terraform.workspace)

  common_tags = merge(
    {
      project     = var.project_name
      environment = local.effective_environment
      managed_by  = "terraform"
    },
    var.tags
  )
}

# Add providers/resources/modules here.
