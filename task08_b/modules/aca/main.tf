resource "azurerm_user_assigned_identity" "aca" {
  name                = "${var.name}-identity"
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = var.tags
}

resource "azurerm_key_vault_access_policy" "aca" {
  key_vault_id = var.keyvault_id
  tenant_id    = var.tenant_id
  object_id    = azurerm_user_assigned_identity.aca.principal_id

  secret_permissions = [
    "Get",
    "List",
  ]
}

resource "azurerm_role_assignment" "aca_acr_pull" {
  scope                = var.acr_id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_user_assigned_identity.aca.principal_id
}

resource "azurerm_container_app_environment" "this" {
  name                = var.env_name
  location            = var.location
  resource_group_name = var.resource_group_name

  workload_profile {
    name                  = var.workload_profile_type
    workload_profile_type = var.workload_profile_type
  }

  tags = var.tags
}

resource "azurerm_container_app" "this" {
  name                         = var.name
  container_app_environment_id = azurerm_container_app_environment.this.id
  resource_group_name          = var.resource_group_name
  revision_mode                = "Single"
  workload_profile_name        = var.workload_profile_type

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.aca.id]
  }

  registry {
    server   = var.acr_login_server
    identity = azurerm_user_assigned_identity.aca.id
  }

  secret {
    name                = "redis-url"
    key_vault_secret_id = "${var.keyvault_uri}secrets/${var.redis_hostname_secret_name}"
    identity            = azurerm_user_assigned_identity.aca.id
  }

  secret {
    name                = "redis-key"
    key_vault_secret_id = "${var.keyvault_uri}secrets/${var.redis_password_secret_name}"
    identity            = azurerm_user_assigned_identity.aca.id
  }

  template {
    container {
      name   = "app"
      image  = "${var.acr_login_server}/${var.image_name}:${var.image_tag}"
      cpu    = var.container_cpu
      memory = var.container_memory

      env {
        name  = "CREATOR"
        value = "ACA"
      }

      env {
        name  = "REDIS_PORT"
        value = "6379"
      }

      env {
        name        = "REDIS_URL"
        secret_name = "redis-url"
      }

      env {
        name        = "REDIS_PWD"
        secret_name = "redis-key"
      }
    }
  }

  ingress {
    external_enabled = true
    target_port      = var.target_port

    traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }

  tags = var.tags

  depends_on = [
    azurerm_key_vault_access_policy.aca,
    azurerm_role_assignment.aca_acr_pull,
  ]
}