connectors:
  - ${var.alert_channel}: ${var.alert_webhook}
  container:
    additionalArgs:
      - -debug
metrics:
  serviceMonitor:
    enabled: ${var.service_monitor}
    additionalLabels:
      release: ${var.release_label}
    scrapeInterval: "30s"

# Pod resources
resources:
  limits:
    cpu: ${limits_cpu}
    memory: ${limits_memory}
  requests:
    cpu: ${request_cpu}
    memory: ${request_memory}