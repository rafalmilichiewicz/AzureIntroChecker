variable "name" {
  description = "Azure Container Instance Name"
  type        = string
}

variable "location" {
  description = "Azure Container Instance Azure Region"
  type        = string
}

variable "resource_group_name" {
  description = "Azure Container Instance Resource Group Name"
  type        = string
}

variable "sku" {
  description = "Azure Container Instance SKU"
  type        = string
}

variable "dns_name_label" {
  description = "Azure Container Instance DNS name label used to build the public FQDN"
  type        = string
}

variable "acr_login_server" {
  description = "Azure Container Instance Login Server"
  type        = string
}

variable "acr_admin_username" {
  description = "Azure Container Instance Admin Username"
  type        = string
}

variable "acr_admin_password" {
  description = "Azure Container Instance Admin Password"
  type        = string
  sensitive   = true
}

variable "image_name" {
  description = "Name of the Docker image to run"
  type        = string
}

variable "image_tag" {
  description = "Tag of the Docker image to run"
  type        = string
}

variable "cpu" {
  description = "Container CPU count"
  type        = number
}

variable "memory" {
  description = "Container RAM Amount"
  type        = number
}

variable "redis_url" {
  description = "Redis hostname"
  type        = string
  sensitive   = true
}

variable "redis_pwd" {
  description = "Redis Primary Access Key"
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)
}
