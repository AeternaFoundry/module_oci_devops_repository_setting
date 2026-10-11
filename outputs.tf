output "devops_repository_settings_id" {
  description = "Map of id values across all devops_repository_settings, keyed the same as var.devops_repository_settings except keys with no id are omitted"
  value       = { for k, v in oci_devops_repository_setting.devops_repository_settings : k => v.id if v.id != null && length(v.id) > 0 }
}
output "devops_repository_settings_approval_rules" {
  description = "Map of approval_rules values across all devops_repository_settings, keyed the same as var.devops_repository_settings except keys with no approval_rules are omitted"
  value       = { for k, v in oci_devops_repository_setting.devops_repository_settings : k => one(v.approval_rules) if v.approval_rules != null && length(v.approval_rules) > 0 }
}
output "devops_repository_settings_merge_checks" {
  description = "Map of merge_checks values across all devops_repository_settings, keyed the same as var.devops_repository_settings except keys with no merge_checks are omitted"
  value       = { for k, v in oci_devops_repository_setting.devops_repository_settings : k => one(v.merge_checks) if v.merge_checks != null && length(v.merge_checks) > 0 }
}
output "devops_repository_settings_merge_settings" {
  description = "Map of merge_settings values across all devops_repository_settings, keyed the same as var.devops_repository_settings except keys with no merge_settings are omitted"
  value       = { for k, v in oci_devops_repository_setting.devops_repository_settings : k => one(v.merge_settings) if v.merge_settings != null && length(v.merge_settings) > 0 }
}
output "devops_repository_settings_repository_id" {
  description = "Map of repository_id values across all devops_repository_settings, keyed the same as var.devops_repository_settings except keys with no repository_id are omitted"
  value       = { for k, v in oci_devops_repository_setting.devops_repository_settings : k => v.repository_id if v.repository_id != null && length(v.repository_id) > 0 }
}

