variable "devops_repository_settings" {
  description = <<EOT
Map of devops_repository_settings, attributes below
Required:
    - repository_id
Optional:
    - approval_rules (block):
        - items (required, block):
            - destination_branch (optional)
            - min_approvals_count (required)
            - name (required)
            - reviewers (optional, block):
                - principal_id (required)
    - merge_checks (block):
        - last_build_succeeded (required)
    - merge_settings (block):
        - allowed_merge_strategies (required)
        - default_merge_strategy (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    repository_id = string
    approval_rules = optional(object({
      items = list(object({
        destination_branch  = optional(string)
        min_approvals_count = number
        name                = string
        reviewers = optional(list(object({
          principal_id = string
        })))
      }))
    }))
    merge_checks = optional(object({
      last_build_succeeded = string
    }))
    merge_settings = optional(object({
      allowed_merge_strategies = list(string)
      default_merge_strategy   = string
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.devops_repository_settings : (
        v.approval_rules == null || (length(v.approval_rules.items) >= 1)
      )
    ])
    error_message = "Each items list must contain at least 1 items"
  }
}

