resource "azurerm_container_registry" "acr" {
    name = "acr2${var.project_name}${var.environment}"
    location = var.location
    resource_group_name = "rg-${var.project_name}-${var.environment}"
    sku = "Basic"
    admin_enabled = true
    tags = var.tags
}