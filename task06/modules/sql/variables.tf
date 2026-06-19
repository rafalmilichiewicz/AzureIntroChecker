variable "resource_group_name" {
  description = "SQL Server Resource Group Name"
  type        = string
}

variable "location" {
  description = "SQL Server Location"
  type        = string
}

variable "sql_server_name" {
  description = "SQL Server Name"
  type        = string
}

variable "sql_db_name" {
  description = "SQL Server Database Name"
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

variable "key_vault_id" {
  description = "Existing Key Vault ID"
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

variable "tags" {
  description = "SQL Server Tags"
  type        = map(string)
}
