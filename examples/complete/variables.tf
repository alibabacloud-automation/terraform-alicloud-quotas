# Variables for Quotas Module Example

variable "region" {
  type        = string
  description = "The region where resources will be created"
  default     = "cn-hangzhou"
}

variable "quota_alarm_name" {
  type        = string
  description = "The name of the quota alarm"
  default     = "example-quota-alarm"
}