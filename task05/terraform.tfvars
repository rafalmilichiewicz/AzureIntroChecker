resource_groups = {
  rg1 = {
    name     = "cmaz-35odz4yl-mod5-rg-01"
    location = "westeurope"
  }
  rg2 = {
    name     = "cmaz-35odz4yl-mod5-rg-02"
    location = "northeurope"
  }
  rg3 = {
    name     = "cmaz-35odz4yl-mod5-rg-03"
    location = "eastus"
  }
}

app_service_plans = {
  asp1 = {
    name               = "cmaz-35odz4yl-mod5-asp-01"
    sku_name           = "S1"
    worker_count       = "2"
    resource_group_key = "rg1"
  }
  asp2 = {
    name               = "cmaz-35odz4yl-mod5-asp-02"
    sku_name           = "S1"
    worker_count       = "1"
    resource_group_key = "rg2"
  }
}

app_services = {
  app1 = {
    name               = "cmaz-35odz4yl-mod5-app-01"
    resource_group_key = "rg1"
    asp_key            = "asp1"
  }
  app2 = {
    name               = "cmaz-35odz4yl-mod5-app-02"
    resource_group_key = "rg2"
    asp_key            = "asp2"
  }
}

app_allow_ip_rule  = "allow-ip"
app_allow_tag_rule = "allow-tm"
allowed_ip_address = "18.153.146.156"

traffic_manager = {
  name                   = "cmaz-35odz4yl-mod5-traf"
  resource_group_key     = "rg3"
  traffic_routing_method = "Performance"
}

tags = {
  Creator = "rafal_milichiewicz@epam.com"
}
