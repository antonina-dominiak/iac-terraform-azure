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

resource "azurerm_storage_container" "rg" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.rg.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "rg" {
  name                   = var.storage_blob_name
  storage_account_name   = azurerm_storage_account.rg.name
  storage_container_name = azurerm_storage_container.rg.name
  type                   = "Block"
  source_content_type    = "text/plain"
  content_type           = "text/plain"
  content                = "blob content"
}
