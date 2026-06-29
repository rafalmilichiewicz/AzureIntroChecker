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
    dockerfile_path      = var.dockerfile_path
    context_path         = var.git_repository_url
    context_access_token = var.git_pat
    image_names          = ["${var.image_name}:${var.image_tag}"]
  }
}

# Triggers an immediate run of the ACR task so the image exists before
# ACI / AKS try to pull it
resource "azurerm_container_registry_task_schedule_run_now" "trigger" {
  container_registry_task_id = azurerm_container_registry_task.build.id
}
