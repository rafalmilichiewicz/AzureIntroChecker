variable "name" {
  description = "Azure Kubernetes Service Name"
  type        = string
}

variable "location" {
  description = "Azure Kubernetes Service Region"
  type        = string
}

variable "resource_group_name" {
  description = "Azure Kubernetes Service Resource Group Name"
  type        = string
}

variable "dns_prefix" {
  description = "Azure Kubernetes Service DNS Prefix"
  type        = string
}

variable "default_node_pool_name" {
  description = "AKS Default Node Pool Name"
  type        = string
}

variable "node_count" {
  description = "AKS Default Node Pool Node Count"
  type        = number
}

variable "vm_size" {
  description = "AKS Default Node Pool VM SKU"
  type        = string
}

variable "os_disk_type" {
  description = "AKS Default Node Pool OS Disk Type"
  type        = string
}

variable "acr_id" {
  description = "Azure Container Registry ID"
  type        = string
}

variable "keyvault_id" {
  description = "Key Vault ID"
  type        = string
}

variable "tenant_id" {
  description = "Azure Active Directory Tenant ID"
  type        = string
}

variable "tags" {
  description = "Tags"
  type        = map(string)
}
