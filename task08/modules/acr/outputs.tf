output "id" {
  description = "Azure Container Registry Resource ID"
  value       = azurerm_container_registry.this.id
}

output "login_server" {
  description = "Azure Container Registry Resource Login Server URL"
  value       = azurerm_container_registry.this.login_server
}

output "admin_username" {
  description = "Azure Container Registry Admin Username"
  value       = azurerm_container_registry.this.admin_username
}

output "admin_password" {
  description = "Azure Container Registry Admin Password"
  value       = azurerm_container_registry.this.admin_password
  sensitive   = true
}

output "task_id" {
  description = "Azure Container Registry Build Task Resource ID"
  value       = azurerm_container_registry_task.build.id
}
