variable "rg" {
  description = "Resource Group"
  type        = string
  default     = "ter-RG"
}

variable "logs-ws" {
  description = "Resource Group"
  type        = string
  default     = "ter-log-ws"
}

variable "app1" {
  description = "Application Backend"
  type        = string
  default     = "ter-ca-java"
}

variable "app2" {
  description = "Application Frontend"
  type        = string
  default     = "ter-ca-node"
}

variable "cont-app-env" {
  description = "Container app env"
  type        = string
  default     = "ter-ca-env"
}

variable "location" {
  description = "Location"
  type        = string
  default     = "canadacentral"
}