terraform {
  required_version = ">= 1.5.0"
}

# Enforce workspace usage by preventing runs in the default workspace.
check "workspace_not_default" {
  assert {
    condition     = terraform.workspace != "default"
    error_message = "Do not use the default workspace. Create/select a named workspace like dev or prod."
  }
}
