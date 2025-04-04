resource "azurerm_mssql_server" "sqlserver" {
  name = "dbserver2-${var.project_name}-${var.environment}"
  resource_group_name = azurerm_resource_group.rg.name
  location = var.location
  version = "12.0"
  administrator_login = var.sqladminusername
  administrator_login_password = var.sqladminpassword
  tags = var.tags
}

resource "azurerm_mssql_database" "db" {
    name = "db-${var.project_name}-${var.environment}"
    server_id = azurerm_mssql_server.sqlserver.id
    sku_name = "S0"
    tags = var.tags
}

resource "azurerm_redis_cache" "redis" {
    name = "redis2-${var.project_name}-${var.environment}"
    location = var.location
    resource_group_name = azurerm_resource_group.rg.name
    capacity = 1
    family = "C"
    sku_name = "Basic"
    tags = var.tags
    non_ssl_port_enabled = false
    redis_configuration {
      
    }
}

resource "azurerm_search_service" "search" {
  name = "search2-${var.project_name}-${var.environment}"
  resource_group_name = "rg-${var.project_name}-${var.environment}"
  location = var.location
  sku = "basic"
  partition_count = 1
  replica_count = 1
  tags = var.tags
  
}

resource "azurerm_cosmosdb_account" "mongo" {
  name = "cosmosdb2-${var.project_name}-${var.environment}"
  location = var.location
  resource_group_name = "rg-${var.project_name}-${var.environment}"
  offer_type = "Standard"
  kind = "MongoDB"
  geo_location {
    location          = var.location
    failover_priority = 0
  }
  consistency_policy {
    consistency_level = "Session"
  }
  tags = var.tags
  capabilities {
    name = "EnableMongo"
  }
}

resource "azurerm_cosmosdb_mongo_database" "mongo_db" {
  name = "cosmosdb2-${var.project_name}-${var.environment}"
  resource_group_name = "rg-${var.project_name}-${var.environment}"
  account_name = azurerm_cosmosdb_account.mongo.name
}