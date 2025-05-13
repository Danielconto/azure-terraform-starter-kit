resource "azurerm_resource_group" "staging" {
  name     = "staging-rg"
  location = "East US"
}

resource "azurerm_storage_account" "staging" {
  name                     = "stagingstorageacct"
  resource_group_name      = azurerm_resource_group.staging.name
  location                 = azurerm_resource_group.staging.location
  account_tier             = "Standard"
  account_replication_type  = "LRS"
}

resource "azurerm_app_service_plan" "staging" {
  name                = "staging-app-service-plan"
  location           = azurerm_resource_group.staging.location
  resource_group_name = azurerm_resource_group.staging.name
  sku {
    tier     = "Standard"
    size     = "S1"
  }
}

resource "azurerm_app_service" "staging" {
  name                = "staging-app-service"
  location           = azurerm_resource_group.staging.location
  resource_group_name = azurerm_resource_group.staging.name
  app_service_plan_id = azurerm_app_service_plan.staging.id

  site_config {
    always_on = true
  }
}