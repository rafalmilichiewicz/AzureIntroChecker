output "fqdn" {
  description = "Fully qualified domain name of the Redis Container Instance"
  value       = azurerm_container_group.redis.fqdn
}
