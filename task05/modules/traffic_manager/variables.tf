variable "name" {
  description = "Traffic Manager Profile Name"
  type        = string
}

variable "resource_group_name" {
  description = "Traffic Manager Profile Resource Group Name"
  type        = string
}

variable "traffic_routing_method" {
  description = "Traffic Manager Profile Routing Method"
  type        = string
}

variable "endpoints" {
  description = "Traffic Manager Profile Endpoint Configurations"
  type = list(object({
    name               = string
    target_resource_id = string
  }))
}

variable "tags" {
  description = "Traffic Manager Profile Tags"
  type        = map(string)
}
