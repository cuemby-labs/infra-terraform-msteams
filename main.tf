#
# Install MSTeams resources
#

resource "kubernetes_secret" "myalertmanager" {
  metadata {
    name      = "myalertmanager"
    namespace = "prometheus-system"
  }

  data = {
    "alertmanager.yaml" = <<EOT
global:
  resolve_timeout: 10m
route:
  group_by: ['job']
  group_wait: 5m
  group_interval: 15m
  repeat_interval: 1h
  receiver: 'webhook'
receivers:
- name: 'webhook'
  webhook_configs:
  - url: "${var.alert_webhook}"
    send_resolved: true
EOT
  }

  type = "Opaque"
}

resource "helm_release" "prometheus_msteams" {
  name       = var.helm_release_name
  repository = "https://prometheus-msteams.github.io/prometheus-msteams"
  chart      = "prometheus-msteams"
  version    = var.helm_release_version
  namespace  = var.namespace_name

  values = [
    yamlencode({
      connectors = [{
        alerts = var.alert_webhook
      }]
      container = {
        additionalArgs = ["-debug"]
      }
      metrics = {
        serviceMonitor = {
          enabled = var.service_monitor
          additionalLabels = {
            release = var.release_label
          }
          scrapeInterval = "30s"
        }
      }
    })
  ]
}

#
# Walrus information
#

locals {
  context = var.context
}

module "submodule" {
  source = "./modules/submodule"

  message = "Hello, submodule"
}