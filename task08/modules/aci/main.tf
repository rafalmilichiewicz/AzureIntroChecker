resource "azurerm_container_group" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku                 = var.sku
  ip_address_type     = "Public"
  dns_name_label      = var.dns_name_label

  image_registry_credential {
    server   = var.acr_login_server
    username = var.acr_admin_username
    password = var.acr_admin_password
  }

  container {
    name   = "redis-flask-app"
    image  = "${var.acr_login_server}/${var.image_name}:${var.image_tag}"
    cpu    = var.cpu
    memory = var.memory

    ports {
      port     = 8080
      protocol = "TCP"
    }

    environment_variables = {
      CREATOR        = "ACI"
      REDIS_PORT     = "6380"
      REDIS_SSL_MODE = "True"
    }

    secure_environment_variables = {
      REDIS_URL = var.redis_url
      REDIS_PWD = var.redis_pwd
    }
  }

  tags = var.tags
}
