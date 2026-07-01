output "id" {
  description = "Azure Container Registry ID"
  value       = azurerm_container_registry.this.id
}

output "login_server" {
  description = "Container Registry Login Server (hostname)"
  value       = azurerm_container_registry.this.login_server
}
