# Example usage of Quotas Module

# Provider configuration
provider "alicloud" {
  region = var.region
}

# Data sources to get existing resources
data "alicloud_resource_manager_accounts" "this" {}

# Call the Quotas module
module "quotas" {
  source = "../../"

  # Enable quota alarm creation
  create_quota_alarm = true
  quota_alarm_config = {
    product_code      = "gws"
    quota_action_code = "q_desktop-count"
    quota_alarm_name  = var.quota_alarm_name
    threshold_percent = 80
    threshold_type    = "used"
    quota_dimensions = [{
      key   = "regionId"
      value = "cn-hangzhou"
    }]
  }

  # Enable quota application creation
  create_quota_application = false
  quota_application_config = {
    product_code      = "quotas"
    quota_action_code = "GeneralDaily"
    desire_value      = 100
    reason            = "Need more daily quota for testing"
    quota_category    = "CommonQuota"
    notice_type       = 3
    env_language      = "en"
    dimensions        = []
  }

  # Enable template quota creation
  create_template_quota = true
  template_quota_config = {
    product_code      = "gws"
    quota_action_code = "q_desktop-count"
    desire_value      = 101
    quota_category    = "CommonQuota"
    notice_type       = 3
    env_language      = "zh"
    dimensions = [
      {
        key   = "regionId"
        value = "cn-hangzhou"
      }
    ]
  }

  # Enable template service creation
  create_template_service = true
  template_service_config = {
    service_status = 1
  }

  # Enable template applications creation
  create_template_applications = true
  template_applications_config = {
    product_code      = "quotas"
    quota_action_code = "quotas.label_multi/A"
    desire_value      = "1"
    reason            = "Need quota template applications"
    quota_category    = "WhiteListLabel"
    notice_type       = "0"
    env_language      = "en"
    aliyun_uids       = [data.alicloud_resource_manager_accounts.this.accounts[0].account_id]
  }
}