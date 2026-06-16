output "id" {
  description = "Traffic Manager Profile ID"
  value       = azurerm_traffic_manager_profile.this.id
}

output "name" {
  description = "Traffic Manager Profile Name"
  value       = azurerm_traffic_manager_profile.this.name
}

output "fqdn" {
  description = "Traffic Manager Profile FQDN"
  value       = azurerm_traffic_manager_profile.this.fqdn
}
