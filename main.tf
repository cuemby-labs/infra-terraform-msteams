#
# Install MSTeams using Helm
#

resource "helm_release" "prometheus-msteams" {
  name       = var.helm_release_name
  repository = "https://prometheus-msteams.github.io/"
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