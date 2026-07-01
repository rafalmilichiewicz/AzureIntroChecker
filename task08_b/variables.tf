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

variable "keyvault_sku" {
  description = "Key Vault SKU"
  type        = string
}

variable "storage_account_replication_type" {
  description = "Storage Account Replication Type"
  type        = string
}

variable "storage_container_name" {
  description = "Storage Account Blob Container Name"
  type        = string
}

variable "storage_container_access_type" {
  description = "Storage Account Blob Container Access Level"
  type        = string
}

variable "sas_validity_hours" {
  description = "SAS Token Valid Number of Hours"
  type        = number
}


variable "redis_sku" {
  description = "Azure Container Instance Redis SKU"
  type        = string
}

variable "redis_image" {
  description = "Microsoft Artifact Registry Container Image for Redis"
  type        = string
}

variable "redis_container_cpu" {
  description = "Azure Container Instance Redis Number of vCPUs"
  type        = number
}

variable "redis_container_memory" {
  description = "Azure Container Instance Redis Amount of memory (in GB)"
  type        = number
}

variable "redis_password_length" {
  description = "Length of the randomly generated Redis password (minimum 16 characters as per task spec)"
  type        = number
}

variable "redis_dns_label" {
  description = "Azure Container Instance Redis DNS Name Label"
  type        = string
}

variable "redis_password_secret_name" {
  description = "Key Vault Secret Name for Redis hostname (FQDN)"
  type        = string
}

variable "redis_hostname_secret_name" {
  description = "Key Vault Secret Name for Redis Redis password"
  type        = string
}

variable "acr_sku" {
  description = "Azure Container Registry SKU"
  type        = string
}

variable "docker_image_name" {
  description = "Image Name"
  type        = string
}

variable "docker_image_tag" {
  description = "Image Tag"
  type        = string
}

variable "aks_default_node_pool_name" {
  description = "AKS Default Node Pool Name"
  type        = string
}

variable "aks_default_node_pool_count" {
  description = "AKS Default Node Pool Node Count"
  type        = number
}

variable "aks_default_node_pool_vm_size" {
  description = "AKS Default Node Pool VM SKU"
  type        = string
}

variable "aks_default_node_pool_os_disk_type" {
  description = "AKS Default Node Pool OS Disk Type"
  type        = string
}

variable "aca_workload_profile_type" {
  description = "Azure Container App & Environment Workload Profile"
  type        = string
}

variable "aca_container_cpu" {
  description = "Azure Container App Number of vCPUs"
  type        = number
}

variable "aca_container_memory" {
  description = "Azure Container App Amount of memory (in GB)"
  type        = string
}

variable "aca_target_port" {
  description = "Container App Ingress Port"
  type        = number
}