variable "name" {
  description = "AKS Name"
  type        = string
}

variable "location" {
  description = "AKS Azure Region"
  type        = string
}

variable "resource_group_name" {
  description = "AKS Resource Group Name"
  type        = string
}

variable "dns_prefix" {
  description = "AKS DNS Prefix"
  type        = string
}

variable "node_pool_name" {
  description = "AKS Default Node Pool Name"
  type        = string
}

variable "node_count" {
  description = "AKS Default Node Pool Number of Nodes"
  type        = number
}

variable "node_size" {
  description = "AKS VM size"
  type        = string
}

variable "os_disk_type" {
  description = "AKS OS Disk Type"
  type        = string
}

variable "acr_id" {
  description = "ACR Resource ID"
  type        = string
}

variable "key_vault_id" {
  description = "Key Vault Resource ID"
  type        = string
}

variable "tenant_id" {
  description = "Tenant ID"
  type        = string
}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)
}
