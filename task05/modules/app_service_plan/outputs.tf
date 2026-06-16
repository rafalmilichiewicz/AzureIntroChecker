output "id" {
  description = "App Service Plan ID"
  value       = azurerm_service_plan.this.id
}

output "name" {
  description = "App Service Plan Name"
  value       = azurerm_service_plan.this.name
}
