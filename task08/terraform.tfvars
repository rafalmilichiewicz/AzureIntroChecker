resources_name_prefix = "cmtr-35odz4yl-mod8"
location              = "East US"
student_email         = "rafal_milichiewicz@epam.com"

git_repository_url = "https://github.com/rafalmilichiewicz/AzureIntroChecker"

image_name = "redis-flask-app"
image_tag  = "latest"


redis_capacity   = 1
redis_sku        = "Standard"
redis_sku_family = "C"

redis_hostname_secret_name    = "redis-hostname"
redis_primary_key_secret_name = "redis-primary-key"


keyvault_sku = "standard"

acr_sku = "Standard"

aci_sku = "Standard"

aks_node_pool_name      = "default"
aks_node_pool_count     = 2
aks_node_pool_size      = "Standard_DS2_v2"
aks_node_pool_disk_type = "Managed"
