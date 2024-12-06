connectors:
- ${alert_channel}: ${alert_webhook}
container:
  additionalArgs:
    - -debug
metrics:
  serviceMonitor:
    enabled: ${service_monitor}
    additionalLabels:
      release: ${release_label}
    scrapeInterval: "30s"

# Pod resources
resources:
  limits:
    cpu: ${limits_cpu}
    memory: ${limits_memory}
  requests:
    cpu: ${request_cpu}
    memory: ${request_memory}