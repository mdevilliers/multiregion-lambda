
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| api\_name | The name of the api gateway | string | `""` | no |
| api\_stage\_name | The api gateway stage name to use | string | `""` | no |
| api\_swagger\_filepath | The path to the application swagger file | string | `""` | no |
| lambda\_function\_name | The name of the lambda function | string | `""` | no |
| lambda\_invoke\_arn | The unique arn to invoke the lambda | string | `""` | no |
| region | The region to deploy to | string | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| base\_url | URL for the gateway frontend |
