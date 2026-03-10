# Variables for Quotas Module

# Quota Alarm Configuration
variable "create_quota_alarm" {
  type        = bool
  description = "Whether to create a quota alarm. If false, an existing quota alarm ID must be provided."
  default     = false
}

variable "quota_alarm_id" {
  type        = string
  description = "The ID of an existing quota alarm. Required when create_quota_alarm is false."
  default     = null
}

variable "quota_alarm_config" {
  type = object({
    product_code      = string
    quota_action_code = string
    quota_alarm_name  = string
    threshold_percent = optional(number, null)
    threshold         = optional(number, null)
    threshold_type    = optional(string, "used")
    web_hook          = optional(string, null)
    quota_dimensions = optional(list(object({
      key   = string
      value = string
    })), [])
  })
  description = "Configuration for quota alarm. The attributes 'product_code', 'quota_action_code', and 'quota_alarm_name' are required."
  default = {
    product_code      = null
    quota_action_code = null
    quota_alarm_name  = null
  }
}

# Quota Application Configuration
variable "create_quota_application" {
  type        = bool
  description = "Whether to create a quota application. If false, an existing quota application ID must be provided."
  default     = false
}

variable "quota_application_id" {
  type        = string
  description = "The ID of an existing quota application. Required when create_quota_application is false."
  default     = null
}

variable "quota_application_config" {
  type = object({
    product_code      = string
    quota_action_code = string
    desire_value      = number
    reason            = string
    quota_category    = optional(string, "CommonQuota")
    notice_type       = optional(number, 3)
    audit_mode        = optional(string, null)
    effective_time    = optional(string, null)
    expire_time       = optional(string, null)
    env_language      = optional(string, "zh")
    dimensions = optional(list(object({
      key   = string
      value = string
    })), [])
  })
  description = "Configuration for quota application. The attributes 'product_code', 'quota_action_code', 'desire_value', and 'reason' are required."
  default = {
    product_code      = null
    quota_action_code = null
    desire_value      = null
    reason            = null
  }
}

# Template Quota Configuration
variable "create_template_quota" {
  type        = bool
  description = "Whether to create a template quota. If false, an existing template quota ID must be provided."
  default     = false
}

variable "template_quota_id" {
  type        = string
  description = "The ID of an existing template quota. Required when create_template_quota is false."
  default     = null
}

variable "template_quota_config" {
  type = object({
    product_code      = string
    quota_action_code = string
    desire_value      = number
    quota_category    = optional(string, "CommonQuota")
    notice_type       = optional(number, 3)
    effective_time    = optional(string, null)
    expire_time       = optional(string, null)
    env_language      = optional(string, "zh")
    dimensions = optional(list(object({
      key   = string
      value = string
    })), [])
  })
  description = "Configuration for template quota. The attributes 'product_code', 'quota_action_code', and 'desire_value' are required."
  default = {
    product_code      = null
    quota_action_code = null
    desire_value      = null
  }
}

# Template Service Configuration
variable "create_template_service" {
  type        = bool
  description = "Whether to create a template service. If false, an existing template service ID must be provided."
  default     = false
}

variable "template_service_id" {
  type        = string
  description = "The ID of an existing template service. Required when create_template_service is false."
  default     = null
}

variable "template_service_config" {
  type = object({
    service_status = number
  })
  description = "Configuration for template service. The attribute 'service_status' is required. Valid values: -1 (disabled), 1 (enabled)."
  default = {
    service_status = 1
  }
}

# Template Applications Configuration
variable "create_template_applications" {
  type        = bool
  description = "Whether to create template applications. If false, an existing template applications ID must be provided."
  default     = false
}

variable "template_applications_id" {
  type        = string
  description = "The ID of an existing template applications. Required when create_template_applications is false."
  default     = null
}

variable "template_applications_config" {
  type = object({
    product_code      = string
    quota_action_code = string
    desire_value      = string
    reason            = string
    quota_category    = string
    aliyun_uids       = list(string)
    notice_type       = optional(string, "0")
    effective_time    = optional(string, null)
    expire_time       = optional(string, null)
    env_language      = optional(string, "zh")
    dimensions = optional(list(object({
      key   = string
      value = string
    })), [])
  })
  description = "Configuration for template applications. The attributes 'product_code', 'quota_action_code', 'desire_value', 'reason', 'quota_category', and 'aliyun_uids' are required."
  default = {
    product_code      = null
    quota_action_code = null
    desire_value      = null
    reason            = null
    quota_category    = null
    aliyun_uids       = []
  }
}