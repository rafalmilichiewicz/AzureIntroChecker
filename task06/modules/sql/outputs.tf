output "sql_server_id" {
  description = "SQL Server Resource ID"
  value       = azurerm_mssql_server.main.id
}

output "sql_server_fqdn" {
  description = "SQL Server FQDN"
  value       = azurerm_mssql_server.main.fully_qualified_domain_name
}

output "sql_db_name" {
  description = "SQL Server Database Name"
  value       = azurerm_mssql_database.main.name
}

output "sql_admin_username" {
  description = "SQL Server Admin Username"
  value       = var.sql_admin_username
}

output "sql_connection_string" {
  description = "ADO.NET Connection String"
  value       = "Server=tcp:${azurerm_mssql_server.main.fully_qualified_domain_name},1433;Initial Catalog=${azurerm_mssql_database.main.name};Persist Security Info=False;User ID=${var.sql_admin_username};Password=${random_password.sql_admin.result};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
  sensitive   = true
}
