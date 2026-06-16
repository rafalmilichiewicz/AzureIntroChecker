output "id" {
  description = "App Service Name"
  value       = azurerm_windows_web_app.this.id
}

output "name" {
  description = "App Service Name"
  value       = azurerm_windows_web_app.this.name
}

output "default_hostname" {
  description = "App Service Default Hostname"
  value       = azurerm_windows_web_app.this.default_hostname
}
