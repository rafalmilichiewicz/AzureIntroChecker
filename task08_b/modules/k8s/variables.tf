variable "manifests_path" {
  description = "Kubernetes Manifest Templates Path"
  type        = string
}

variable "acr_login_server" {
  description = "Azure Container Registry Login server"
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

variable "aks_kv_access_identity_id" {
  description = "Key Vault Secrets Provider user-assigned identity Client ID"
  type        = string
}

variable "kv_name" {
  description = "Key Vault Name"
  type        = string
}

variable "tenant_id" {
  description = "Azure Active Directory Tenant ID"
  type        = string
}

variable "redis_url_secret_name" {
  description = "Key Vault Secret Name for Redis hostname (FQDN)"
  type        = string
}

variable "redis_password_secret_name" {
  description = "Key Vault Secret Name for Redis Redis password"
  type        = string
}
