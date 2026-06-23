variable "location" {
  type        = string
  description = "Azure region"
}

variable "rg_name" {
  type        = string
  description = "Resource Group Name"
}

variable "rg_id" {
  type        = string
  description = "Resource Group ID"
}

variable "sa_name" {
  type        = string
  description = "Storage Account Name"
}

variable "sa_id" {
  type        = string
  description = "Storage Account ID"
}

variable "blob_file" {
  type        = string
  description = "Filename in Storage Account"
}

variable "container_name" {
  type        = string
  description = "Storage Container name (within the Storage Account) that holds the blob file"
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

variable "student_email" {
  description = "Used as the value of the Creator tag applied to every resource."
  type        = string
}