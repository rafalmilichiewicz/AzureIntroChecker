variable "rg_name" {
  type        = string
  description = "Resource Group Name"
}

variable "storage_blob_host" {
  type        = string
  description = " Storage Account Primary Blob Endpoint Hostname"
}

variable "fd_profile_name" {
  type        = string
  description = "Azure CDN Front Door Profile Name"
}

variable "fd_profile_sku" {
  type        = string
  description = "Azure CDN Front Door Profile SKU"
}

variable "fd_endpoint_name" {
  type        = string
  description = "Azure CDN Front Door Endpoint Name"
}

variable "fd_origin_group_name" {
  type        = string
  description = "Azure CDN Front Door Origin Group Name"
}

variable "fd_origin_name" {
  type        = string
  description = "Azure CDN Front Door Origin Name"
}

variable "fd_route_name" {
  type        = string
  description = "Azure CDN Front Door Route Name"
}
