resource "azurerm_kubernetes_cluster" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name         = var.node_pool_name
    node_count   = var.node_count
    vm_size      = var.node_size
    os_disk_type = var.os_disk_type
  }

  identity {
    type = "SystemAssigned"
  }

  # Enables the Key Vault Secrets Provider (CSI driver) add-on.
  key_vault_secrets_provider {
    secret_rotation_enabled = true
  }

  tags = var.tags
}

# Allows AKS (via kubelet identity) to pull images from ACR
resource "azurerm_role_assignment" "acr_pull" {
  scope                = var.acr_id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.this.kubelet_identity[0].object_id
}

# Allows the Key Vault Secrets Provider identity to read secrets from Key Vault
resource "azurerm_key_vault_access_policy" "aks_secrets_provider" {
  key_vault_id = var.key_vault_id
  tenant_id    = var.tenant_id
  object_id    = azurerm_kubernetes_cluster.this.key_vault_secrets_provider[0].secret_identity[0].object_id

  secret_permissions = ["Get"]
}
