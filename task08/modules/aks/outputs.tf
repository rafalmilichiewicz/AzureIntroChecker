output "id" {
  description = "AKS Resource ID"
  value       = azurerm_kubernetes_cluster.this.id
}

output "name" {
  description = "AKS Cluster Name"
  value       = azurerm_kubernetes_cluster.this.name
}

output "host" {
  description = "Kubernetes API Server Endpoint"
  value       = azurerm_kubernetes_cluster.this.kube_config[0].host
  sensitive   = true
}

output "client_certificate" {
  description = "Base64-encoded client certificate for cluster auth"
  value       = azurerm_kubernetes_cluster.this.kube_config[0].client_certificate
  sensitive   = true
}

output "client_key" {
  description = "Base64-encoded client key for cluster auth"
  value       = azurerm_kubernetes_cluster.this.kube_config[0].client_key
  sensitive   = true
}

output "cluster_ca_certificate" {
  description = "Base64-encoded cluster CA certificate"
  value       = azurerm_kubernetes_cluster.this.kube_config[0].cluster_ca_certificate
  sensitive   = true
}

output "kv_identity_client_id" {
  description = "Key Vault Secrets Provider user-assigned identity Client ID"
  value       = azurerm_kubernetes_cluster.this.key_vault_secrets_provider[0].secret_identity[0].client_id
}
