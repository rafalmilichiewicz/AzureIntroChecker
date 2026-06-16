variable "name" {
  description = "App Service Plan Name"
  type        = string
}

variable "location" {
  description = "App Service Plan Location"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group for App Service Plan"
  type        = string
}

variable "sku_name" {
  description = "App Service Plan SKU Name"
  type        = string
}

variable "worker_count" {
  description = "App Service Plan Number of Workers"
  type        = number
}

variable "tags" {
  description = "App Service Plan Tags"
  type        = map(string)
}
