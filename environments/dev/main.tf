provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "dev_rg" {
  name     = "dev-resource-group"
  location = "East US"
}

resource "azurerm_storage_account" "dev_storage" {
  name                     = "devstorageacct"
  resource_group_name      = azurerm_resource_group.dev_rg.name
  location                 = azurerm_resource_group.dev_rg.location
  account_tier             = "Standard"
  account_replication_type  = "LRS"
}

resource "azurerm_app_service_plan" "dev_app_service_plan" {
  name                = "dev-app-service-plan"
  location           = azurerm_resource_group.dev_rg.location
  resource_group_name = azurerm_resource_group.dev_rg.name
  sku {
    tier     = "Standard"
    size     = "S1"
  }
}

resource "azurerm_app_service" "dev_app_service" {
  name                = "dev-app-service"
  location           = azurerm_resource_group.dev_rg.location
  resource_group_name = azurerm_resource_group.dev_rg.name
  app_service_plan_id = azurerm_app_service_plan.dev_app_service_plan.id

  app_settings = {
    "StorageAccount" = azurerm_storage_account.dev_storage.name
  }
}