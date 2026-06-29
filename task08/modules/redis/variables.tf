variable "name" {
  description = "Redis Instance Name"
  type        = string
}

variable "location" {
  description = "Redis Azure Region"
  type        = string
}

variable "resource_group_name" {
  description = "Redis Resource Group Name"
  type        = string
}

variable "capacity" {
  description = "Size of the Redis cache"
  type        = number
}

variable "sku_name" {
  description = "Redis SKU"
  type        = string
}

variable "family" {
  description = "Redis SKU family"
  type        = string
}

variable "tags" {
  description = "Redis Tags"
  type        = map(string)
}

variable "key_vault_id" {
  description = "Key Vault Resource ID"
  type        = string
}

variable "hostname_secret_name" {
  description = "Key Vault Redis hostname"
  type        = string
}

variable "primary_key_secret_name" {
  description = "Key Vault Redis Name of Primary Access Key"
  type        = string
}
