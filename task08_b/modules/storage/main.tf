locals {
  archive_name = "app-content.tar.gz"
}

data "archive_file" "app_archive" {
  type        = "tar.gz"
  source_dir  = var.source_dir
  output_path = "${path.root}/.archives/${local.archive_name}"
}

resource "time_static" "sas_start" {}

resource "time_offset" "sas_expiry" {
  base_rfc3339 = time_static.sas_start.rfc3339
  offset_hours = var.sas_validity_hours
}

resource "azurerm_storage_account" "this" {
  name                     = var.name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = var.account_replication_type

  tags = var.tags
}

resource "azurerm_storage_container" "this" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.this.name
  container_access_type = var.container_access_type

  depends_on = [
    azurerm_storage_account.this
  ]
}

resource "azurerm_storage_blob" "app_archive" {
  name                   = local.archive_name
  storage_account_name   = azurerm_storage_account.this.name
  storage_container_name = azurerm_storage_container.this.name
  type                   = "Block"
  source                 = data.archive_file.app_archive.output_path

  depends_on = [
    azurerm_storage_container.this
  ]
}

data "azurerm_storage_account_blob_container_sas" "this" {
  connection_string = azurerm_storage_account.this.primary_connection_string
  container_name    = azurerm_storage_container.this.name
  https_only        = true

  start  = time_static.sas_start.rfc3339
  expiry = time_offset.sas_expiry.rfc3339

  permissions {
    read   = true
    add    = false
    create = false
    write  = false
    delete = false
    list   = true
  }

  depends_on = [
    azurerm_storage_container.this,
    azurerm_storage_account.this
  ]
}
