# Outputs for Quotas Module

# Quota Alarm Outputs
output "quota_alarm_id" {
  description = "The ID of the quota alarm"
  value       = var.create_quota_alarm ? alicloud_quotas_quota_alarm.alarm[0].id : var.quota_alarm_id
}

# Quota Application Outputs
output "quota_application_id" {
  description = "The ID of the quota application"
  value       = var.create_quota_application ? alicloud_quotas_quota_application.application[0].id : var.quota_application_id
}

output "quota_application_status" {
  description = "The status of the quota application"
  value       = var.create_quota_application ? alicloud_quotas_quota_application.application[0].status : null
}

output "quota_application_approve_value" {
  description = "The approved value of the quota application"
  value       = var.create_quota_application ? alicloud_quotas_quota_application.application[0].approve_value : null
}

# Template Quota Outputs
output "template_quota_id" {
  description = "The ID of the template quota"
  value       = var.create_template_quota ? alicloud_quotas_template_quota.template_quota[0].id : var.template_quota_id
}

# Template Service Outputs
output "template_service_id" {
  description = "The ID of the template service"
  value       = var.create_template_service ? alicloud_quotas_template_service.template_service[0].id : var.template_service_id
}

# Template Applications Outputs
output "template_applications_id" {
  description = "The ID of the template applications"
  value       = var.create_template_applications ? alicloud_quotas_template_applications.template_applications[0].id : var.template_applications_id
}

output "template_applications_quota_application_details" {
  description = "The quota application details of template applications"
  value       = var.create_template_applications ? alicloud_quotas_template_applications.template_applications[0].quota_application_details : []
}