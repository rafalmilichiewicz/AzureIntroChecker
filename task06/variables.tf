variable "location" {
  description = "Azure region where resources will be deployed."
  type        = string
}

variable "student_email" {
  description = "Used as the value of the Creator tag applied to every resource."
  type        = string
}

variable "name_prefix" {
  description = "Prefix Name used for Locals"
  type        = string
}

variable "kv_rg_name" {
  description = "Key Vault Resource Group Name"
  type        = string
}

variable "kv_name" {
  description = "Key Vault Name"
  type        = string
}

variable "sql_admin_secret_name" {
  description = "Key Vault Secret name for SQL admin name"
  type        = string
}

variable "sql_admin_secret_password" {
  description = "Key Vault Secret name for SQL admin password"
  type        = string
}

variable "sql_sku" {
  description = "SQL Server SKU"
  type        = string
}

variable "sql_admin_username" {
  description = "SQL Server Admin Username"
  type        = string
}

variable "sql_fwr_name" {
  description = "SQL Server Firewall Rule Name"
  type        = string
}

variable "allowed_ip_address" {
  description = "SQL Server Allowed Public IP Address"
  type        = string
}

variable "asp_sku" {
  description = "App Service Plan SKU"
  type        = string
}


variable "app_dotnet_version" {
  description = ".NET version"
  type        = string
}
