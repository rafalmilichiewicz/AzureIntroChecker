variable "name" {
  description = "Key Vault Name"
  type        = string
}

variable "location" {
  description = "Key Vault Region"
  type        = string
}

variable "resource_group_name" {
  description = "Key Vault Resource Group Name"
  type        = string
}

variable "sku_name" {
  description = "Key Vault SKU"
  type        = string
}

variable "tenant_id" {
  description = "Tenant ID"
  type        = string
}

variable "object_id" {
  description = "Object ID"
  type        = string
}

variable "tags" {
  description = "Key Vault Tags"
  type        = map(string)
}
