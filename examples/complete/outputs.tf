# Outputs for Quotas Module Example

# output "quota_alarm_id" {  # Commented out since create_quota_alarm is false
#   description = "The ID of the created quota alarm"
#   value       = module.quotas.quota_alarm_id
# }

# output "quota_application_id" {  # Commented out since create_quota_application is false
#   description = "The ID of the created quota application"
#   value       = module.quotas.quota_application_id
# }

# output "quota_application_status" {  # Commented out since create_quota_application is false
#   description = "The status of the quota application"
#   value       = module.quotas.quota_application_status
# }

# output "template_quota_id" {  # Commented out since create_template_quota is false
#   description = "The ID of the created template quota"
#   value       = module.quotas.template_quota_id
# }

output "template_service_id" {
  description = "The ID of the created template service"
  value       = module.quotas.template_service_id
}

# output "template_applications_id" {  # Commented out since create_template_applications is false
#   description = "The ID of the created template applications"
#   value       = module.quotas.template_applications_id
# }

# output "template_applications_details" {  # Commented out since create_template_applications is false
#   description = "The quota application details of template applications"
#   value       = module.quotas.template_applications_quota_application_details
# }