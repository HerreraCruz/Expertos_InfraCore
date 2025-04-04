provider "azurerm" {
    subscription_id = var.subscription_id
  features {}
}

resource "azurerm_resource_group" "rg" {
    name = "rg-${var.project_name}-${var.environment}"
    location = var.location
    tags = var.tags
}