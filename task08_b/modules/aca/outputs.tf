output "fqdn" {
  description = "Container App FQDN"
  value       = azurerm_container_app.this.latest_revision_fqdn
}