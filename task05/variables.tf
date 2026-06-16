variable "resource_groups" {
  description = "Resource Group Configuration Map"
  type = map(object({
    name     = string
    location = string
  }))
}

variable "app_service_plans" {
  description = "App Service Plan Configuration Map"
  type = map(object({
    name               = string
    sku_name           = string
    worker_count       = number
    resource_group_key = string
  }))
}

variable "app_services" {
  description = "App Service Configuration Map"
  type = map(object({
    name               = string
    resource_group_key = string
    asp_key            = string
  }))
}

variable "app_allow_ip_rule" {
  description = "App Services IP Allow Rule Name"
  type        = string
}

variable "app_allow_tag_rule" {
  description = "Access restriction allow TM service tag rule name"
  type        = string
}

variable "allowed_ip_address" {
  description = "Verification agent IP address"
  type        = string
}

variable "traffic_manager" {
  description = "Traffic Manager Profile Configuration Map"
  type = object({
    name                   = string
    resource_group_key     = string
    traffic_routing_method = string
  })
}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)
}
