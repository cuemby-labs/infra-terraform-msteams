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
  - url: 'http://prometheus-msteams:2000/${var.alert_channel}'
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
    templatefile("${path.module}/values.yaml.tpl", {
      alert_channel   = var.alert_channel,
      alert_webhook   = var.alert_webhook,
      service_monitor = var.service_monitor,
      release_label   = var.release_label,
      request_memory  = var.resources["requests"]["memory"],
      limits_memory   = var.resources["limits"]["memory"],
      request_cpu     = var.resources["requests"]["cpu"],
      limits_cpu      = var.resources["limits"]["cpu"]
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