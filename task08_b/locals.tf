locals {
  # Some resources can't contain "-" in the name 
  name_no_dash = replace(var.resources_name_prefix, "-", "")

  rg_name        = "${var.resources_name_prefix}-rg"
  redis_aci_name = "${var.resources_name_prefix}-redis-ci"
  sa_name        = "${local.name_no_dash}sa"
  keyvault_name  = "${var.resources_name_prefix}-kv"
  acr_name       = "${local.name_no_dash}cr"
  aca_env_name   = "${var.resources_name_prefix}-cae"
  aca_name       = "${var.resources_name_prefix}-ca"
  aks_name       = "${var.resources_name_prefix}-aks"

  common_tags = {
    Creator = var.student_email
  }
}
