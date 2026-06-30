locals {

  rg_name = format("%s-rg", var.resources_name_prefix)

  acr_name = replace(format("%scr", var.resources_name_prefix), "/[^a-zA-Z0-9]/", "")

  aci_name = format("%s-ci", var.resources_name_prefix)
  aks_name = format("%s-aks", var.resources_name_prefix)

  keyvault_name = format("%s-kv", var.resources_name_prefix)

  redis_name = format("%s-redis", var.resources_name_prefix)

  service_name = replace(var.image_name, "-app", "-service")
  common_tags = {
    Creator = var.student_email
  }
}
