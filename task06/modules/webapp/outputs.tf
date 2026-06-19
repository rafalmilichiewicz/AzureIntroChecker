output "app_hostname" {
  description = "Linux Web App Default Hostname"
  value       = azurerm_linux_web_app.this.default_hostname
}

output "app_id" {
  description = "Linux Web App Resource ID"
  value       = azurerm_linux_web_app.this.id
}
