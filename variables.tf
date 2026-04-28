variable "project_name" {
  description = "Logical project name used in naming/tagging."
  type        = string
}

variable "aws_region" {
  description = "AWS region for provider operations."
  type        = string
}

variable "aws_profile" {
  description = "Optional AWS shared credentials profile name."
  type        = string
  default     = null
}

variable "aws_assume_role_arn" {
  description = "Optional IAM role ARN to assume before provider operations."
  type        = string
  default     = null
}

variable "aws_assume_role_session_name" {
  description = "Optional session name to use when assuming a role."
  type        = string
  default     = null
}

variable "environment" {
  description = "Optional explicit environment name. Defaults to terraform.workspace when null."
  type        = string
  default     = null
}

variable "tags" {
  description = "Optional extra tags/labels to merge into common metadata."
  type        = map(string)
  default     = {}
}
