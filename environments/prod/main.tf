resource "azurerm_resource_group" "prod" {
  name     = "prod-resource-group"
  location = "East US"
}

resource "azurerm_storage_account" "prod" {
  name                     = "prodstorageaccount"
  resource_group_name      = azurerm_resource_group.prod.name
  location                 = azurerm_resource_group.prod.location
  account_tier            = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_app_service_plan" "prod" {
  name                = "prod-app-service-plan"
  location           = azurerm_resource_group.prod.location
  resource_group_name = azurerm_resource_group.prod.name
  sku {
    tier     = "Standard"
    size     = "S1"
  }
}

resource "azurerm_app_service" "prod" {
  name                = "prod-app-service"
  location           = azurerm_resource_group.prod.location
  resource_group_name = azurerm_resource_group.prod.name
  app_service_plan_id = azurerm_app_service_plan.prod.id

  site_config {
    always_on = true
  }
}