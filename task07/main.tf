import {
  to = azurerm_resource_group.rg
  id = var.rg_id
}

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location

  tags = local.tags
}


import {
  to = azurerm_storage_account.sa
  id = var.sa_id
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


module "cdn" {
  source = "./modules/cdn"

  rg_name           = azurerm_resource_group.rg.name
  storage_blob_host = azurerm_storage_account.sa.primary_blob_host

  fd_profile_name      = var.fd_profile_name
  fd_profile_sku       = var.fd_profile_sku
  fd_endpoint_name     = var.fd_endpoint_name
  fd_origin_group_name = var.fd_origin_group_name
  fd_origin_name       = var.fd_origin_name
  fd_route_name        = var.fd_route_name
}
