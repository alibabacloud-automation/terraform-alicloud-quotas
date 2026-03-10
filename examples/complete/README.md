# Complete Example for Quotas Module

This example demonstrates how to use the Quotas module to manage Alibaba Cloud quota resources.

## Usage

To run this example, you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which can cost money. Run `terraform destroy` when you don't need these resources.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.116.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | >= 1.116.0 |

## Resources

This example will create the following resources:

- Quota alarm for monitoring quota usage
- Quota application for requesting quota increases
- Template quota for managing quota templates
- Template service for quota template service management
- Template applications for batch quota applications

## Variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_region"></a> [region](#input\_region) | The region where resources will be created | `string` | `"cn-hangzhou"` | no |
| <a name="input_quota_alarm_name"></a> [quota\_alarm\_name](#input\_quota\_alarm\_name) | The name of the quota alarm | `string` | `"example-quota-alarm"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_quota_alarm_id"></a> [quota\_alarm\_id](#output\_quota\_alarm\_id) | The ID of the created quota alarm |
| <a name="output_quota_application_id"></a> [quota\_application\_id](#output\_quota\_application\_id) | The ID of the created quota application |
| <a name="output_quota_application_status"></a> [quota\_application\_status](#output\_quota\_application\_status) | The status of the quota application |
| <a name="output_template_quota_id"></a> [template\_quota\_id](#output\_template\_quota\_id) | The ID of the created template quota |
| <a name="output_template_service_id"></a> [template\_service\_id](#output\_template\_service\_id) | The ID of the created template service |
| <a name="output_template_applications_id"></a> [template\_applications\_id](#output\_template\_applications\_id) | The ID of the created template applications |
| <a name="output_template_applications_details"></a> [template\_applications\_details](#output\_template\_applications\_details) | The quota application details of template applications |

## Notes

- This example creates quota resources for the GWS (Graphics Workstation) service
- The quota application may require manual approval from Alibaba Cloud support
- Template applications require valid Alibaba Cloud account IDs (UIDs)
- Some resources like quota applications and template applications cannot be destroyed and will be removed from Terraform state only