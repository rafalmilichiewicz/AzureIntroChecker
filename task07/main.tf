import {
  to = azurerm_resource_group.rg
  id = "/subscriptions/29002178-a3a8-4fe4-8aeb-c9cdc3942cf7/resourceGroups/cmtr-35odz4yl-mod7-rg"
}

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location

  tags = local.tags
}


import {
  to = azurerm_storage_account.sa
  id = "/subscriptions/29002178-a3a8-4fe4-8aeb-c9cdc3942cf7/resourceGroups/cmtr-35odz4yl-mod7-rg/providers/Microsoft.Storage/storageAccounts/cmtr35odz4ylmod7sa"
}

resource "azurerm_storage_account" "sa" {
  name                = var.sa_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location

  # Needs to match for Terraform not to recreate
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"

  allow_nested_items_to_be_public  = false
  cross_tenant_replication_enabled = false

  tags = local.tags
}


import {
  to = azurerm_storage_container.container
  id = "/subscriptions/29002178-a3a8-4fe4-8aeb-c9cdc3942cf7/resourceGroups/cmtr-35odz4yl-mod7-rg/providers/Microsoft.Storage/storageAccounts/cmtr35odz4ylmod7sa/blobServices/default/containers/mycontainer"
}

resource "azurerm_storage_container" "container" {
  name                  = var.container_name
  storage_account_id    = azurerm_storage_account.sa.id
  container_access_type = "private"
}


import {
  to = azurerm_storage_blob.blob
  id = "https://cmtr35odz4ylmod7sa.blob.core.windows.net/mycontainer/blob.txt"
}

resource "azurerm_storage_blob" "blob" {
  name                   = var.blob_file
  storage_account_name   = azurerm_storage_account.sa.name
  storage_container_name = azurerm_storage_container.container.name
  type                   = "Block"
}


module "cdn" {
  source = "./modules/cdn"

  rg_name           = azurerm_resource_group.rg.name
  storage_blob_host = azurerm_storage_account.sa.primary_blob_host
  container_name    = azurerm_storage_container.container.name

  fd_profile_name      = var.fd_profile_name
  fd_profile_sku       = var.fd_profile_sku
  fd_endpoint_name     = var.fd_endpoint_name
  fd_origin_group_name = var.fd_origin_group_name
  fd_origin_name       = var.fd_origin_name
  fd_route_name        = var.fd_route_name
}
