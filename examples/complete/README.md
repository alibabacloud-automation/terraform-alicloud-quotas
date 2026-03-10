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

## Notes

- This example creates quota resources for the GWS (Graphics Workstation) service
- The quota application may require manual approval from Alibaba Cloud support
- Template applications require valid Alibaba Cloud account IDs (UIDs)
- Some resources like quota applications and template applications cannot be destroyed and will be removed from Terraform state only