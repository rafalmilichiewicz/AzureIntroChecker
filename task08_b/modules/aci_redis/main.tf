resource "random_password" "redis" {
  length      = var.redis_password_length
  special     = false # just to be sure $ or / is not there
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}

resource "azurerm_container_group" "redis" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  ip_address_type     = "Public"
  dns_name_label      = var.dns_name_label
  sku                 = var.sku

  container {
    name   = "redis"
    image  = var.redis_image
    cpu    = var.container_cpu
    memory = var.container_memory

    ports {
      port     = 6379
      protocol = "TCP"
    }

    commands = [
      "redis-server",
      "--protected-mode",
      "no",
      "--requirepass",
      random_password.redis.result,
    ]
  }

  tags = var.tags
}

resource "azurerm_key_vault_secret" "redis_password" {
  name         = var.redis_password_secret_name
  value        = random_password.redis.result
  key_vault_id = var.keyvault_id
}

resource "azurerm_key_vault_secret" "redis_hostname" {
  name         = var.redis_hostname_secret_name
  value        = azurerm_container_group.redis.fqdn
  key_vault_id = var.keyvault_id
}
