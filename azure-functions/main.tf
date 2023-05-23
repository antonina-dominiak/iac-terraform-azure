resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_storage_account" "rg" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
}

resource "azurerm_app_service_plan" "rg" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku {
    tier = var.app_service_plan_tier
    size = var.app_service_plan_size
  }
}

resource "azurerm_linux_function_app" "rg" {
  name                      = var.function_app_name
  location                  = azurerm_resource_group.rg.location
  resource_group_name       = azurerm_resource_group.rg.name
  app_service_plan_id       = azurerm_app_service_plan.rg.id
  storage_account_name      = azurerm_storage_account.rg.name
  storage_account_access_key = azurerm_storage_account.rg.primary_access_key
}

resource "azurerm_function_app_function" "rg" {
  name                       = var.function_name
  resource_group_name        = azurerm_resource_group.rg.name
  function_app_id            = azurerm_linux_function_app.rg.id
  storage_account_name       = azurerm_storage_account.rg.name
  storage_account_access_key = azurerm_storage_account.rg.primary_access_key
}
