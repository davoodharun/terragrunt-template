// can use terraform registry modules
locals {
  resource_groups = {for k, v in var.resources : k => 
     {
      name = v.resource_group_name
      location = v.location
      appsettings = v.appsettings
     }
  
  }
}

resource "azurerm_service_plan" "example" {
  for_each = local.resource_groups
  name                = format("%s-%s-%s-ASP", var.identifier.primary, var.identifier.secondary, var.identifier.type)
  resource_group_name = each.value.name
  location            = each.value.location
  os_type             = var.service_plan.os_type
  sku_name            = var.service_plan.sku_name
}

resource "azurerm_linux_web_app" "example" {
  for_each = local.resource_groups
  name                = format("%s-%s", var.identifier.primary, var.identifier.secondary)
  resource_group_name = each.value.name
  location            = each.value.location
  service_plan_id     = azurerm_service_plan.example[each.key].id

  site_config {}
}