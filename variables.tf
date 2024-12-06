#
# MSTeams
#

variable "namespace_name" {
  description = "Namespace where MSTeams will be installed."
  type        = string
  default     = "prometheus-system"
}

variable "helm_release_name" {
  description = "Name for the MSTeams Helm release."
  type        = string
  default     = "prometheus-msteams"
}

variable "helm_release_version" {
  description = "Version of the MSTeams Helm chart."
  type        = string
  default     = "1.3.4"
}

variable "alert_webhook" {
  description = "Webhook URL for Prometheus alerts to MS Teams"
  type        = string
  default     = "https://new.webhook.url/..."
}

variable "alert_channel" {
  description = "Channel name for Prometheus alerts to MS Teams"
  type        = string
  default     = "alerts_dev"
}

variable "service_monitor" {
  description = "Enable or disable the service monitor"
  type        = bool
  default     = true
}

variable "release_label" {
  description = "Label used for the Prometheus release"
  type        = string
  default     = "prometheus"
}

variable "resources" {
  description = "Resource limits and requests for the Prometheus msteams Helm release."
  type        = map(map(string))

  default = {
    limits = {
      cpu    = "10m"
      memory = "32Mi"
    }
    requests = {
      cpu    = "1m"
      memory = "8Mi"
    }
  }
}

#
# Contextual Fields
#

variable "context" {
  description = <<-EOF
Receive contextual information. When Walrus deploys, Walrus will inject specific contextual information into this field.

Examples:
```
context:
  project:
    name: string
    id: string
  environment:
    name: string
    id: string
  resource:
    name: string
    id: string
```
EOF
  type        = map(any)
  default     = {}
}
