variable "name" {
  description = "App Service Name"
  type        = string
}

variable "location" {
  description = "App Service Location"
  type        = string
}

variable "resource_group_name" {
  description = "App Service Resource Group Name"
  type        = string
}

variable "service_plan_id" {
  description = "App Service Plan ID"
  type        = string
}

variable "ip_restrictions" {
  description = "App Service IP Restrictions"
  type = list(object({
    name        = string
    action      = string
    priority    = number
    ip_address  = optional(string)
    service_tag = optional(string)
  }))
}

variable "tags" {
  description = "App Service Tags"
  type        = map(string)
}
