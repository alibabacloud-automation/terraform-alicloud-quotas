# Quotas Module - Main Configuration

# Quota Alarm Resource
resource "alicloud_quotas_quota_alarm" "alarm" {
  count = var.create_quota_alarm ? 1 : 0

  product_code      = var.quota_alarm_config.product_code
  quota_action_code = var.quota_alarm_config.quota_action_code
  quota_alarm_name  = var.quota_alarm_config.quota_alarm_name
  threshold_percent = var.quota_alarm_config.threshold_percent
  threshold         = var.quota_alarm_config.threshold
  threshold_type    = var.quota_alarm_config.threshold_type
  web_hook          = var.quota_alarm_config.web_hook

  dynamic "quota_dimensions" {
    for_each = var.quota_alarm_config.quota_dimensions
    content {
      key   = quota_dimensions.value.key
      value = quota_dimensions.value.value
    }
  }
}

# Quota Application Resource
resource "alicloud_quotas_quota_application" "application" {
  count = var.create_quota_application ? 1 : 0

  product_code      = var.quota_application_config.product_code
  quota_action_code = var.quota_application_config.quota_action_code
  desire_value      = var.quota_application_config.desire_value
  reason            = var.quota_application_config.reason
  quota_category    = var.quota_application_config.quota_category
  notice_type       = var.quota_application_config.notice_type
  audit_mode        = var.quota_application_config.audit_mode
  effective_time    = var.quota_application_config.effective_time
  expire_time       = var.quota_application_config.expire_time
  env_language      = var.quota_application_config.env_language

  dynamic "dimensions" {
    for_each = var.quota_application_config.dimensions
    content {
      key   = dimensions.value.key
      value = dimensions.value.value
    }
  }
}

# Template Quota Resource
resource "alicloud_quotas_template_quota" "template_quota" {
  count = var.create_template_quota ? 1 : 0

  product_code      = var.template_quota_config.product_code
  quota_action_code = var.template_quota_config.quota_action_code
  desire_value      = var.template_quota_config.desire_value
  quota_category    = var.template_quota_config.quota_category
  notice_type       = var.template_quota_config.notice_type
  effective_time    = var.template_quota_config.effective_time
  expire_time       = var.template_quota_config.expire_time
  env_language      = var.template_quota_config.env_language

  dynamic "dimensions" {
    for_each = var.template_quota_config.dimensions
    content {
      key   = dimensions.value.key
      value = dimensions.value.value
    }
  }
}

# Template Service Resource
resource "alicloud_quotas_template_service" "template_service" {
  count = var.create_template_service ? 1 : 0

  service_status = var.template_service_config.service_status
}

# Template Applications Resource
resource "alicloud_quotas_template_applications" "template_applications" {
  count = var.create_template_applications ? 1 : 0

  product_code      = var.template_applications_config.product_code
  quota_action_code = var.template_applications_config.quota_action_code
  desire_value      = var.template_applications_config.desire_value
  reason            = var.template_applications_config.reason
  quota_category    = var.template_applications_config.quota_category
  notice_type       = var.template_applications_config.notice_type
  effective_time    = var.template_applications_config.effective_time
  expire_time       = var.template_applications_config.expire_time
  env_language      = var.template_applications_config.env_language
  aliyun_uids       = var.template_applications_config.aliyun_uids

  dynamic "dimensions" {
    for_each = var.template_applications_config.dimensions
    content {
      key   = dimensions.value.key
      value = dimensions.value.value
    }
  }
}