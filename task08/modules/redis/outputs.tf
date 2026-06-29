output "id" {
  description = "Redis Resource ID"
  value       = azurerm_redis_cache.this.id
}

output "hostname" {
  description = "Redis Hostname"
  value       = azurerm_redis_cache.this.hostname
}

output "primary_access_key" {
  description = "Redis Primary access key"
  value       = azurerm_redis_cache.this.primary_access_key
  sensitive   = true
}

output "ssl_port" {
  description = "Redis SSL port"
  value       = azurerm_redis_cache.this.ssl_port
}

output "hostname_secret_name" {
  description = "Key Vault Redis Hostname"
  value       = azurerm_key_vault_secret.hostname.name
}

output "primary_key_secret_name" {
  description = "Key Vault Redis Primary Access Key"
  value       = azurerm_key_vault_secret.primary_key.name
}
