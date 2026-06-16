module "resource_group" {
  source   = "./modules/resource_group"
  for_each = var.resource_groups

  name     = each.value.name
  location = each.value.location
  tags     = var.tags
}

module "app_service_plan" {
  source   = "./modules/app_service_plan"
  for_each = var.app_service_plans

  name                = each.value.name
  location            = module.resource_group[each.value.resource_group_key].location
  resource_group_name = module.resource_group[each.value.resource_group_key].name
  sku_name            = each.value.sku_name
  worker_count        = each.value.worker_count
  tags                = var.tags

  depends_on = [module.resource_group]
}

module "app_service" {
  source   = "./modules/app_service"
  for_each = var.app_services

  name                = each.value.name
  location            = module.resource_group[each.value.resource_group_key].location
  resource_group_name = module.resource_group[each.value.resource_group_key].name
  service_plan_id     = module.app_service_plan[each.value.asp_key].id
  tags                = var.tags

  ip_restrictions = [
    {
      name        = var.app_allow_tag_rule
      action      = "Allow"
      priority    = 100
      service_tag = "AzureTrafficManager"
    },
    {
      name       = var.app_allow_ip_rule
      action     = "Allow"
      priority   = 200
      ip_address = "${var.allowed_ip_address}/32"
    }
  ]

  depends_on = [module.app_service_plan]
}

module "traffic_manager" {
  source = "./modules/traffic_manager"

  name                   = var.traffic_manager.name
  resource_group_name    = module.resource_group[var.traffic_manager.resource_group_key].name
  traffic_routing_method = var.traffic_manager.traffic_routing_method
  tags                   = var.tags

  endpoints = [
    for key, app in var.app_services : {
      name               = module.app_service[key].name
      target_resource_id = module.app_service[key].id
    }
  ]

  depends_on = [module.app_service]
}
