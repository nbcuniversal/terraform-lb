## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| access_logs_bucket |  | string | - | yes |
| access_logs_enabled |  | string | `true` | no |
| budget |  | string | - | yes |
| enable_deletion_protection |  | string | `true` | no |
| environment |  | string | - | yes |
| internal_loadbalancer |  | string | `false` | no |
| lifecycle_create_before_destroy |  | string | `true` | no |
| subnet_ids |  | string | - | yes |
| vpc_id |  | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| arn |  |
| dns_name |  |
| http_listener_arn |  |
| https_listener_arn |  |
| zone_id |  |
