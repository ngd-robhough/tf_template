terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile

  dynamic "assume_role" {
    for_each = var.aws_assume_role_arn == null ? [] : [var.aws_assume_role_arn]

    content {
      role_arn     = assume_role.value
      session_name = coalesce(var.aws_assume_role_session_name, "terraform-${terraform.workspace}")
    }
  }

  default_tags {
    tags = local.common_tags
  }
}
