rg_name = "cmaz-35odz4yl-mod4-rg"


vnet_name             = "cmaz-35odz4yl-mod4-vnet"
vnet_address_space    = ["10.0.0.0/16"]
subnet_name           = "frontend"
subnet_address_prefix = ["10.0.1.0/24"]
nic_name              = "cmaz-35odz4yl-mod4-nic"
nic_ip_config_name    = "internal"

nsg_name      = "cmaz-35odz4yl-mod4-nsg"
nsg_rule_http = "AllowHTTP"
nsg_rule_ssh  = "AllowSSH"

public_ip         = "cmaz-35odz4yl-mod4-pip"
domain_name_label = "cmaz-35odz4yl-mod4-nginx"

vm_name           = "cmaz-35odz4yl-mod4-vm"
vm_admin_username = "azureuser"
vm_os_version     = "ubuntu-24_04-lts"
vm_SKU            = "Standard_B2s_v2"
# vm_password is omitted as per task details

student_email = "rafal_milichiewicz@epam.com"

location = "West Europe"