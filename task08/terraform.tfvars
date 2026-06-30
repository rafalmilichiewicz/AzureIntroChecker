resources_name_prefix = "cmtr-35odz4yl-mod8"
location              = "East US"
student_email         = "rafal_milichiewicz@epam.com"

git_repository_url = "https://github.com/rafalmilichiewicz/AzureIntroChecker"

image_name = "cmtr-35odz4yl-mod8-app"
image_tag  = "latest"
base_name  = "redis-flask-app"


redis_capacity   = 2
redis_sku        = "Basic"
redis_sku_family = "C"

redis_hostname_secret_name    = "redis-primary-key"
redis_primary_key_secret_name = "redis-hostname"


keyvault_sku = "standard"

acr_sku = "Basic"

aci_sku = "Standard"

aks_node_pool_name      = "system"
aks_node_pool_count     = 1
aks_node_pool_size      = "Standard_D2ads_v6"
aks_node_pool_disk_type = "Ephemeral"
