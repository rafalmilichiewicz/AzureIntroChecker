variable "name" {
  description = "Azure Container App Name"
  type        = string
}

variable "env_name" {
  description = "Azure Container App Environment Name"
  type        = string
}

variable "location" {
  description = "Azure Container App Region"
  type        = string
}

variable "resource_group_name" {
  description = "Azure Container App Resource Group Name"
  type        = string
}

variable "workload_profile_type" {
  description = "Azure Container App & Environment Workload Profile"
  type        = string
}

variable "acr_login_server" {
  description = "Azure Container Registry Login server (hostname)"
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

variable "keyvault_uri" {
  description = "Key Vault URI"
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

variable "image_name" {
  description = "Image Name"
  type        = string
}

variable "image_tag" {
  description = "Image Tag"
  type        = string
}

variable "tenant_id" {
  description = "Azure Active Directory Tenant ID"
  type        = string
}

variable "container_cpu" {
  description = "Azure Container App Number of vCPUs"
  type        = number
}

variable "container_memory" {
  description = "Azure Container App Amount of memory (in GB)"
  type        = string
}

variable "target_port" {
  description = "Container App Ingress Port"
  type        = number
}

variable "tags" {
  description = "Tags"
  type        = map(string)
}
