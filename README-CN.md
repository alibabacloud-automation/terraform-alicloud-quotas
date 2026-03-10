阿里云配额管理 Terraform 模块

# terraform-alicloud-quotas

[English](https://github.com/alibabacloud-automation/terraform-alicloud-quotas/blob/main/README.md) | 简体中文

用于创建和管理[阿里云配额资源](https://www.alibabacloud.com/help/zh/quota-center)的 Terraform 模块。该模块提供全面的配额管理功能，包括配额告警、配额申请、模板配额、模板服务和模板应用。它帮助组织通过自动化流程高效地监控和管理云资源配额。

## 使用方法

该模块创建各种配额管理资源，并提供灵活的配置选项。您可以根据需要选择创建新资源或使用现有资源。

```terraform
module "quotas" {
  source = "alibabacloud-automation/quotas/alicloud"

  # 启用配额告警创建
  create_quota_alarm = true
  quota_alarm_config = {
    product_code      = "gws"
    quota_action_code = "q_desktop-count"
    quota_alarm_name  = "example-quota-alarm"
    threshold_percent = 80
    quota_dimensions = [
      {
        key   = "regionId"
        value = "cn-hangzhou"
      }
    ]
  }

  # 启用配额申请创建
  create_quota_application = true
  quota_application_config = {
    product_code      = "gws"
    quota_action_code = "q_desktop-count"
    desire_value      = 1001
    reason            = "需要更多桌面实例配额"
    dimensions = [
      {
        key   = "regionId"
        value = "cn-hangzhou"
      }
    ]
  }
}
```

## 示例

* [完整示例](https://github.com/alibabacloud-automation/terraform-alicloud-quotas/tree/main/examples/complete)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.116.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | >= 1.116.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [alicloud_quotas_quota_alarm.alarm](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/quotas_quota_alarm) | resource |
| [alicloud_quotas_quota_application.application](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/quotas_quota_application) | resource |
| [alicloud_quotas_template_applications.template_applications](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/quotas_template_applications) | resource |
| [alicloud_quotas_template_quota.template_quota](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/quotas_template_quota) | resource |
| [alicloud_quotas_template_service.template_service](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/quotas_template_service) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_quota_alarm"></a> [create\_quota\_alarm](#input\_create\_quota\_alarm) | Whether to create a quota alarm. If false, an existing quota alarm ID must be provided. | `bool` | `false` | no |
| <a name="input_create_quota_application"></a> [create\_quota\_application](#input\_create\_quota\_application) | Whether to create a quota application. If false, an existing quota application ID must be provided. | `bool` | `false` | no |
| <a name="input_create_template_applications"></a> [create\_template\_applications](#input\_create\_template\_applications) | Whether to create template applications. If false, an existing template applications ID must be provided. | `bool` | `false` | no |
| <a name="input_create_template_quota"></a> [create\_template\_quota](#input\_create\_template\_quota) | Whether to create a template quota. If false, an existing template quota ID must be provided. | `bool` | `false` | no |
| <a name="input_create_template_service"></a> [create\_template\_service](#input\_create\_template\_service) | Whether to create a template service. If false, an existing template service ID must be provided. | `bool` | `false` | no |
| <a name="input_quota_alarm_config"></a> [quota\_alarm\_config](#input\_quota\_alarm\_config) | Configuration for quota alarm. The attributes 'product\_code', 'quota\_action\_code', and 'quota\_alarm\_name' are required. | <pre>object({<br/>    product_code      = string<br/>    quota_action_code = string<br/>    quota_alarm_name  = string<br/>    threshold_percent = optional(number, null)<br/>    threshold         = optional(number, null)<br/>    threshold_type    = optional(string, "used")<br/>    web_hook          = optional(string, null)<br/>    quota_dimensions = optional(list(object({<br/>      key   = string<br/>      value = string<br/>    })), [])<br/>  })</pre> | <pre>{<br/>  "product_code": null,<br/>  "quota_action_code": null,<br/>  "quota_alarm_name": null<br/>}</pre> | no |
| <a name="input_quota_alarm_id"></a> [quota\_alarm\_id](#input\_quota\_alarm\_id) | The ID of an existing quota alarm. Required when create\_quota\_alarm is false. | `string` | `null` | no |
| <a name="input_quota_application_config"></a> [quota\_application\_config](#input\_quota\_application\_config) | Configuration for quota application. The attributes 'product\_code', 'quota\_action\_code', 'desire\_value', and 'reason' are required. | <pre>object({<br/>    product_code      = string<br/>    quota_action_code = string<br/>    desire_value      = number<br/>    reason            = string<br/>    quota_category    = optional(string, "CommonQuota")<br/>    notice_type       = optional(number, 3)<br/>    audit_mode        = optional(string, null)<br/>    effective_time    = optional(string, null)<br/>    expire_time       = optional(string, null)<br/>    env_language      = optional(string, "zh")<br/>    dimensions = optional(list(object({<br/>      key   = string<br/>      value = string<br/>    })), [])<br/>  })</pre> | <pre>{<br/>  "desire_value": null,<br/>  "product_code": null,<br/>  "quota_action_code": null,<br/>  "reason": null<br/>}</pre> | no |
| <a name="input_quota_application_id"></a> [quota\_application\_id](#input\_quota\_application\_id) | The ID of an existing quota application. Required when create\_quota\_application is false. | `string` | `null` | no |
| <a name="input_template_applications_config"></a> [template\_applications\_config](#input\_template\_applications\_config) | Configuration for template applications. The attributes 'product\_code', 'quota\_action\_code', 'desire\_value', 'reason', 'quota\_category', and 'aliyun\_uids' are required. | <pre>object({<br/>    product_code      = string<br/>    quota_action_code = string<br/>    desire_value      = string<br/>    reason            = string<br/>    quota_category    = string<br/>    aliyun_uids       = list(string)<br/>    notice_type       = optional(string, "0")<br/>    effective_time    = optional(string, null)<br/>    expire_time       = optional(string, null)<br/>    env_language      = optional(string, "zh")<br/>    dimensions = optional(list(object({<br/>      key   = string<br/>      value = string<br/>    })), [])<br/>  })</pre> | <pre>{<br/>  "aliyun_uids": [],<br/>  "desire_value": null,<br/>  "product_code": null,<br/>  "quota_action_code": null,<br/>  "quota_category": null,<br/>  "reason": null<br/>}</pre> | no |
| <a name="input_template_applications_id"></a> [template\_applications\_id](#input\_template\_applications\_id) | The ID of an existing template applications. Required when create\_template\_applications is false. | `string` | `null` | no |
| <a name="input_template_quota_config"></a> [template\_quota\_config](#input\_template\_quota\_config) | Configuration for template quota. The attributes 'product\_code', 'quota\_action\_code', and 'desire\_value' are required. | <pre>object({<br/>    product_code      = string<br/>    quota_action_code = string<br/>    desire_value      = number<br/>    quota_category    = optional(string, "CommonQuota")<br/>    notice_type       = optional(number, 3)<br/>    effective_time    = optional(string, null)<br/>    expire_time       = optional(string, null)<br/>    env_language      = optional(string, "zh")<br/>    dimensions = optional(list(object({<br/>      key   = string<br/>      value = string<br/>    })), [])<br/>  })</pre> | <pre>{<br/>  "desire_value": null,<br/>  "product_code": null,<br/>  "quota_action_code": null<br/>}</pre> | no |
| <a name="input_template_quota_id"></a> [template\_quota\_id](#input\_template\_quota\_id) | The ID of an existing template quota. Required when create\_template\_quota is false. | `string` | `null` | no |
| <a name="input_template_service_config"></a> [template\_service\_config](#input\_template\_service\_config) | Configuration for template service. The attribute 'service\_status' is required. Valid values: -1 (disabled), 1 (enabled). | <pre>object({<br/>    service_status = number<br/>  })</pre> | <pre>{<br/>  "service_status": 1<br/>}</pre> | no |
| <a name="input_template_service_id"></a> [template\_service\_id](#input\_template\_service\_id) | The ID of an existing template service. Required when create\_template\_service is false. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_quota_alarm_id"></a> [quota\_alarm\_id](#output\_quota\_alarm\_id) | The ID of the quota alarm |
| <a name="output_quota_application_approve_value"></a> [quota\_application\_approve\_value](#output\_quota\_application\_approve\_value) | The approved value of the quota application |
| <a name="output_quota_application_id"></a> [quota\_application\_id](#output\_quota\_application\_id) | The ID of the quota application |
| <a name="output_quota_application_status"></a> [quota\_application\_status](#output\_quota\_application\_status) | The status of the quota application |
| <a name="output_template_applications_id"></a> [template\_applications\_id](#output\_template\_applications\_id) | The ID of the template applications |
| <a name="output_template_applications_quota_application_details"></a> [template\_applications\_quota\_application\_details](#output\_template\_applications\_quota\_application\_details) | The quota application details of template applications |
| <a name="output_template_quota_id"></a> [template\_quota\_id](#output\_template\_quota\_id) | The ID of the template quota |
| <a name="output_template_service_id"></a> [template\_service\_id](#output\_template\_service\_id) | The ID of the template service |
<!-- END_TF_DOCS -->

## 提交问题

如果您在使用此模块时遇到任何问题，请提交一个 [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) 并告知我们。

**注意：** 不建议在此仓库中提交问题。

## 作者

由阿里云 Terraform 团队创建和维护(terraform@alibabacloud.com)。

## 许可证

MIT 许可。有关完整详细信息，请参阅 LICENSE。

## 参考

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)