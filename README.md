# MSTeams Template

Terraform module which deploys MSTeams on any kubernetes cluster.

## Usage

```hcl
module "msteams" {
  source = "./modules/msteams"

  namespace_name        = "prometheus-system"            # Namespace where BlackBox Exporter will be installed  
  helm_release_name     = "prometheus-blackbox-exporter" # Name for the BlackBox Exporter Helm release
  helm_release_version  = "8.17.0"                       # Version of the BlackBox Exporter Helm chart
  alert_webhook         = "https://new.webhook.url/..."  # Webhook URL for Prometheus alerts to MS Teams
  service_monitor       = true                           # Enable or disable serviceMonitor
  release_label         = "prometheus"                   # Label used for the Prometheus release
}
```

## Examples

- ...
- ...

## Contributing

Please read our [contributing guide](./docs/CONTRIBUTING.md) if you're interested in contributing to Walrus template.

<!-- BEGIN_TF_DOCS -->

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.7 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.11.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | >= 2.11.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.example](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_namespace_name"></a> [namespace_name](#input_namespace_name) | Namespace where BlackBox Exporter will be installed. | `string` | `"prometheus-systemn"` | no |
| <a name="input_helm_release_name"></a> [helm_release_name](#input_helm_release_name) | Name for the BlackBox Exporter Helm release. | `string` | `"prometheus-blackbox-exporter"` | no |
| <a name="input_helm_release_version"></a> [helm_release_version](#input_helm_release_version) | Version of the BlackBox Exporter Helm chart. | `string` | `"8.17.0"` | no |
| <a name="input_alert_webhook"></a> [alert_webhook](#input_alert_webhook) | Webhook URL for Prometheus alerts to MS Teams. | `string` | `"https://new.webhook.url/..."` | yes |
| <a name="input_service_monitor"></a> [service_monitor](#input_service_monitor) | Enable or disable serviceMonitor. | `boolean` | `"true"` | no |
| <a name="input_release_label"></a> [release_label](#input_release_label) | Label used for the Prometheus release. | `string` | `"prometheus"` | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_walrus_environment_id"></a> [walrus\_environment\_id](#output\_walrus\_environment\_id) | The id of environment where deployed in Walrus. |
| <a name="output_walrus_environment_name"></a> [walrus\_environment\_name](#output\_walrus\_environment\_name) | The name of environment where deployed in Walrus. |
| <a name="output_walrus_project_id"></a> [walrus\_project\_id](#output\_walrus\_project\_id) | The id of project where deployed in Walrus. |
| <a name="output_walrus_project_name"></a> [walrus\_project\_name](#output\_walrus\_project\_name) | The name of project where deployed in Walrus. |
| <a name="output_walrus_resource_id"></a> [walrus\_resource\_id](#output\_walrus\_resource\_id) | The id of resource where deployed in Walrus. |
| <a name="output_walrus_resource_name"></a> [walrus\_resource\_name](#output\_walrus\_resource\_name) | The name of resource where deployed in Walrus. |
<!-- END_TF_DOCS -->

## License

Copyright (c) 2023 [Seal, Inc.](https://seal.io)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at [LICENSE](./LICENSE) file for details.

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
