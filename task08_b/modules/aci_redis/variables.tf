variable "name" {
  description = "Azure Container Instance Redis Name"
  type        = string
}

variable "location" {
  description = "Azure Container Instance Redis Region"
  type        = string
}

variable "resource_group_name" {
  description = "Azure Container Instance Redis Resource Group Name"
  type        = string
}

variable "sku" {
  description = "Azure Container Instance Redis SKU"
  type        = string
}

variable "dns_name_label" {
  description = "Azure Container Instance Redis DNS Name Label"
  type        = string
}

variable "redis_image" {
  description = "Microsoft Artifact Registry Container Image for Redis"
  type        = string
}

variable "container_cpu" {
  description = "Azure Container Instance Redis Number of vCPUs"
  type        = number
}

variable "container_memory" {
  description = "Azure Container Instance Redis Amount of memory (in GB)"
  type        = number
}

variable "redis_password_length" {
  description = "Length of the randomly generated Redis password (minimum 16 characters as per task spec)"
  type        = number

  validation {
    condition     = var.redis_password_length >= 16
    error_message = "The Redis password length must be at least 16 characters as per task spec"
  }
}

variable "keyvault_id" {
  description = "Key Vault ID"
  type        = string
}

variable "redis_hostname_secret_name" {
  description = "Key Vault Secret Name for Redis hostname (FQDN)"
  type        = string
}

variable "redis_password_secret_name" {
  description = "Key Vault Secret Name for Redis Redis password"
  type        = string
}

variable "tags" {
  description = "Tags"
  type        = map(string)
}
