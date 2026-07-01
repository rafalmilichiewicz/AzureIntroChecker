resources_name_prefix = "cmtr-35odz4yl-mod8b"
location              = "East US"

student_email = "rafal_milichiewicz@epam.com"

redis_sku              = "Standard"
redis_image            = "mcr.microsoft.com/oss/bitnami/redis:6.2"
redis_container_cpu    = 1
redis_container_memory = 1.5
redis_password_length  = 20
redis_dns_label        = "cmtr-35odz4yl-mod8b-redis-ci"

storage_account_replication_type = "LRS"
storage_container_name           = "app-content"
storage_container_access_type    = "private"
sas_validity_hours               = 8760

keyvault_sku               = "standard"
redis_password_secret_name = "redis-password"
redis_hostname_secret_name = "redis-hostname"

# Azure Container Registry
acr_sku           = "Basic"
docker_image_name = "cmtr-35odz4yl-mod8b-app"
docker_image_tag  = "latest"

# Azure Container App / Environment
aca_workload_profile_type = "Consumption"
aca_container_cpu         = 0.5
aca_container_memory      = "1Gi"
aca_target_port           = 8080

# Azure Kubernetes Service
aks_default_node_pool_name         = "system"
aks_default_node_pool_count        = 1
aks_default_node_pool_vm_size      = "Standard_D2ads_v6"
aks_default_node_pool_os_disk_type = "Ephemeral"
