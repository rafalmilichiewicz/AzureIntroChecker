# Current Azure AD context, used to fill the tenantId in the SecretProviderClass
data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "this" {
  name     = local.rg_name
  location = var.location

  tags = local.common_tags
}

module "keyvault" {
  source = "./modules/keyvault"

  name                = local.keyvault_name
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  sku_name            = var.keyvault_sku
  tenant_id           = data.azurerm_client_config.current.tenant_id
  object_id           = data.azurerm_client_config.current.object_id
  tags                = local.common_tags
}

module "storage" {
  source = "./modules/storage"

  name                     = local.sa_name
  location                 = azurerm_resource_group.this.location
  resource_group_name      = azurerm_resource_group.this.name
  account_replication_type = var.storage_account_replication_type
  container_name           = var.storage_container_name
  container_access_type    = var.storage_container_access_type
  source_dir               = "${path.module}/application"
  sas_validity_hours       = var.sas_validity_hours
  tags                     = local.common_tags
}

module "aci_redis" {
  source = "./modules/aci_redis"

  name                       = local.redis_aci_name
  location                   = azurerm_resource_group.this.location
  resource_group_name        = azurerm_resource_group.this.name
  sku                        = var.redis_sku
  dns_name_label             = var.redis_dns_label
  redis_image                = var.redis_image
  container_cpu              = var.redis_container_cpu
  container_memory           = var.redis_container_memory
  redis_password_length      = var.redis_password_length
  keyvault_id                = module.keyvault.id
  redis_hostname_secret_name = var.redis_hostname_secret_name
  redis_password_secret_name = var.redis_password_secret_name
  tags                       = local.common_tags

  depends_on = [module.keyvault]
}

module "acr" {
  source = "./modules/acr"

  name                = local.acr_name
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  sku                 = var.acr_sku
  image_name          = var.docker_image_name
  image_tag           = var.docker_image_tag
  blob_url            = module.storage.blob_url
  sas_token           = module.storage.sas_token
  tags                = local.common_tags

  depends_on = [module.storage]
}

module "aks" {
  source = "./modules/aks"

  name                   = local.aks_name
  location               = azurerm_resource_group.this.location
  resource_group_name    = azurerm_resource_group.this.name
  dns_prefix             = local.name_no_dash
  default_node_pool_name = var.aks_default_node_pool_name
  node_count             = var.aks_default_node_pool_count
  vm_size                = var.aks_default_node_pool_vm_size
  os_disk_type           = var.aks_default_node_pool_os_disk_type
  acr_id                 = module.acr.id
  keyvault_id            = module.keyvault.id
  tenant_id              = data.azurerm_client_config.current.tenant_id
  tags                   = local.common_tags

  depends_on = [module.acr, module.keyvault]
}

module "aca" {
  source = "./modules/aca"

  name                       = local.aca_name
  env_name                   = local.aca_env_name
  location                   = azurerm_resource_group.this.location
  resource_group_name        = azurerm_resource_group.this.name
  workload_profile_type      = var.aca_workload_profile_type
  acr_login_server           = module.acr.login_server
  acr_id                     = module.acr.id
  keyvault_id                = module.keyvault.id
  keyvault_uri               = module.keyvault.vault_uri
  redis_hostname_secret_name = var.redis_hostname_secret_name
  redis_password_secret_name = var.redis_password_secret_name
  image_name                 = var.docker_image_name
  image_tag                  = var.docker_image_tag
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  container_cpu              = var.aca_container_cpu
  container_memory           = var.aca_container_memory
  target_port                = var.aca_target_port
  tags                       = local.common_tags

  depends_on = [module.acr, module.keyvault, module.aci_redis]
}

module "k8s" {
  source = "./modules/k8s"

  manifests_path             = "${path.module}/k8s-manifests"
  acr_login_server           = module.acr.login_server
  image_name                 = var.docker_image_name
  image_tag                  = var.docker_image_tag
  aks_kv_access_identity_id  = module.aks.kv_secrets_provider_client_id
  kv_name                    = local.keyvault_name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  redis_url_secret_name      = var.redis_hostname_secret_name
  redis_password_secret_name = var.redis_password_secret_name

  depends_on = [module.aks, module.acr, module.aci_redis]
}
