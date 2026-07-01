resource "azurerm_container_registry" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  admin_enabled       = true

  tags = var.tags
}

resource "azurerm_container_registry_task" "build" {
  name                  = "${var.name}-build-task"
  container_registry_id = azurerm_container_registry.this.id

  platform {
    os = "Linux"
  }

  docker_step {
    dockerfile_path      = "Dockerfile"
    context_path         = var.blob_url
    context_access_token = var.sas_token
    image_names          = ["${var.image_name}:${var.image_tag}"]
  }
}

# Triggers an immediate run of the ACR task so the image exists before
# ACI / AKS try to pull it
resource "azurerm_container_registry_task_schedule_run_now" "trigger" {
  container_registry_task_id = azurerm_container_registry_task.build.id
}
