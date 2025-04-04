resource "azurerm_storage_account" "staccount" {
    name = "stac${var.project_name}${var.environment}"
    resource_group_name = azurerm_resource_group.rg.name
    location = var.location
    account_tier = "Standard"
    account_replication_type = "LRS"
    tags = var.tags
}

resource "azurerm_storage_container" "cointainer1" {
    name = "filescontainer"
    container_access_type = "private"
    storage_account_id = azurerm_storage_account.staccount.id
}

resource "azurerm_storage_queue" "staqueue" {
  name = "backgroundqueue"
  storage_account_name = azurerm_storage_account.staccount.name
}
