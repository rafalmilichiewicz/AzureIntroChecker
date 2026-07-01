output "blob_url" {
  description = "Blob URL of Archive"
  value       = azurerm_storage_blob.app_archive.url
}

output "sas_token" {
  description = "SAS Token to Blob Container"
  value       = data.azurerm_storage_account_blob_container_sas.this.sas
  sensitive   = true
}
