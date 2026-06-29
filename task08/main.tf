resource "azurerm_resource_group" "this" {
  name     = local.rg_name
  location = var.location
  tags     = local.common_tags
}

module "keyvault" {
  source = "./modules/keyvault"

  name                = local.keyvault_name
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  sku_name            = var.keyvault_sku
  tags                = local.common_tags
}

module "redis" {
  source = "./modules/redis"

  name                    = local.redis_name
  location                = azurerm_resource_group.this.location
  resource_group_name     = azurerm_resource_group.this.name
  capacity                = var.redis_capacity
  sku_name                = var.redis_sku
  family                  = var.redis_sku_family
  tags                    = local.common_tags
  key_vault_id            = module.keyvault.id
  hostname_secret_name    = var.redis_hostname_secret_name
  primary_key_secret_name = var.redis_primary_key_secret_name

  depends_on = [module.keyvault]
}

module "acr" {
  source = "./modules/acr"

  name                = local.acr_name
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  sku                 = var.acr_sku
  tags                = local.common_tags
  git_repository_url  = var.git_repository_url
  git_pat             = var.git_pat
  dockerfile_path     = "task08/application/Dockerfile"
  image_name          = var.image_name
  image_tag           = var.image_tag
}

module "aci" {
  source = "./modules/aci"

  name                = local.aci_name
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  sku                 = var.aci_sku
  dns_name_label      = local.aci_name
  acr_login_server    = module.acr.login_server
  acr_admin_username  = module.acr.admin_username
  acr_admin_password  = module.acr.admin_password
  image_name          = var.image_name
  image_tag           = var.image_tag
  redis_url           = module.redis.hostname
  redis_pwd           = module.redis.primary_access_key
  tags                = local.common_tags
  memory              = 2
  cpu                 = 1

  depends_on = [module.acr, module.redis]
}

# Current Azure AD context, used to fill the tenantId in the SecretProviderClass
data "azurerm_client_config" "current" {}

module "aks" {
  source = "./modules/aks"

  name                = local.aks_name
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  dns_prefix          = local.aks_name
  node_pool_name      = var.aks_node_pool_name
  node_count          = var.aks_node_pool_count
  node_size           = var.aks_node_pool_size
  os_disk_type        = var.aks_node_pool_disk_type
  acr_id              = module.acr.id
  key_vault_id        = module.keyvault.id
  tags                = local.common_tags
  tenant_id          = data.azurerm_client_config.current.tenant_id

  depends_on = [module.acr, module.keyvault]
}



resource "kubectl_manifest" "secret_provider" {
  yaml_body = templatefile("${path.module}/k8s-manifests/secret-provider.yaml.tftpl", {
    aks_kv_access_identity_id  = module.aks.kv_identity_client_id
    kv_name                    = module.keyvault.name
    redis_url_secret_name      = var.redis_hostname_secret_name
    redis_password_secret_name = var.redis_primary_key_secret_name
    tenant_id                  = data.azurerm_client_config.current.tenant_id
  })

  depends_on = [module.aks, module.keyvault]
}

resource "kubectl_manifest" "deployment" {
  yaml_body = templatefile("${path.module}/k8s-manifests/deployment.yaml.tftpl", {
    acr_login_server = module.acr.login_server
    app_image_name   = var.image_name
    image_tag        = var.image_tag
  })

  wait_for {
    field {
      key   = "status.availableReplicas"
      value = "1"
    }
  }

  depends_on = [kubectl_manifest.secret_provider]
}

resource "kubectl_manifest" "service" {
  yaml_body = file("${path.module}/k8s-manifests/service.yaml")

  wait_for {
    field {
      key        = "status.loadBalancer.ingress.[0].ip"
      value      = "^(\\d+(\\.|$)){4}"
      value_type = "regex"
    }
  }

  depends_on = [kubectl_manifest.deployment]
}

data "kubernetes_service" "app" {
  metadata {
    name = "redis-flask-app-service"
  }

  depends_on = [kubectl_manifest.service]
}
