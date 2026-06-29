output "fqdn" {
  description = "Azure Container Instance FQDN"
  value       = azurerm_container_group.this.fqdn
}

output "ip_address" {
  description = "AKS Load Balancer IP Address"
  value       = azurerm_container_group.this.ip_address
}
