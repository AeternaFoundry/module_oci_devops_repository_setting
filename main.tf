resource "oci_devops_repository_setting" "devops_repository_settings" {
  for_each = var.devops_repository_settings

  repository_id = each.value.repository_id

  dynamic "approval_rules" {
    for_each = each.value.approval_rules != null ? [each.value.approval_rules] : []
    content {
      dynamic "items" {
        for_each = approval_rules.value.items
        content {
          destination_branch  = items.value.destination_branch
          min_approvals_count = items.value.min_approvals_count
          name                = items.value.name
          dynamic "reviewers" {
            for_each = items.value.reviewers != null ? items.value.reviewers : []
            content {
              principal_id = reviewers.value.principal_id
            }
          }
        }
      }
    }
  }

  dynamic "merge_checks" {
    for_each = each.value.merge_checks != null ? [each.value.merge_checks] : []
    content {
      last_build_succeeded = merge_checks.value.last_build_succeeded
    }
  }

  dynamic "merge_settings" {
    for_each = each.value.merge_settings != null ? [each.value.merge_settings] : []
    content {
      allowed_merge_strategies = merge_settings.value.allowed_merge_strategies
      default_merge_strategy   = merge_settings.value.default_merge_strategy
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

