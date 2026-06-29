variable "resources_name_prefix" {
  description = "Resource Name Prefix"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "student_email" {
  description = "Student Email Address"
  type        = string
}

variable "git_repository_url" {
  description = "git repository URL"
  type        = string
}

variable "git_pat" {
  description = "Git PAT"
  type        = string
  sensitive   = true
}

variable "image_name" {
  description = "Docker Image Name"
  type        = string
}

variable "image_tag" {
  description = "Docker Image Tag"
  type        = string
}


variable "redis_capacity" {
  description = "Redis Capacity"
  type        = number
}

variable "redis_sku" {
  description = "Redis SKU"
  type        = string
}

variable "redis_sku_family" {
  description = "Redis SKU Family"
  type        = string
}

variable "redis_hostname_secret_name" {
  description = "Redis Hostname Secret Name"
  type        = string
}

variable "redis_primary_key_secret_name" {
  description = "Redis Primary Key Secret Name"
  type        = string
}

variable "keyvault_sku" {
  description = "Key Vault SKU"
  type        = string
}

variable "acr_sku" {
  description = "Azure Container Registry SKU"
  type        = string
}


variable "aci_sku" {
  description = "Azure Container Instance SKU"
  type        = string
}


variable "aks_node_pool_name" {
  description = "AKS Default Node Pool Name"
  type        = string
}

variable "aks_node_pool_count" {
  description = "AKS Default Node Pool Number of Nodes"
  type        = number
}

variable "aks_node_pool_size" {
  description = "AKS Default Node Pool VM Size"
  type        = string
}

variable "aks_node_pool_disk_type" {
  description = "AKS Default Node Pool OS Disk Type"
  type        = string
}
