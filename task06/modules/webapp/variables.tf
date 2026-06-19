variable "resource_group_name" {
  description = "App Service Resource Group Name"
  type        = string
}

variable "location" {
  description = "App Service Location"
  type        = string
}

variable "asp_name" {
  description = "pp Service Plan Name"
  type        = string
}

variable "asp_sku" {
  description = "App Service Plan SKU"
  type        = string
}

variable "app_name" {
  description = "Linux Web App Name"
  type        = string
}

variable "app_dotnet_version" {
  description = ".NET version"
  type        = string
}

variable "sql_connection_string" {
  description = "ADO.NET connection string to the SQL Database"
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "App Service Tags"
  type        = map(string)
}
