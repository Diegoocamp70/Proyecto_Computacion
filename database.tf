resource "azurerm_storage_account" "almacenamiento" {
  name                     = "hcstorageaccount" 
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  access_tier              = "Cool"

   tags = {
    environment = "Development"
    project     = "Projecto_inicial"
    name        = "almacenamiento"
  }
}

resource "azurerm_storage_container" "container-almacenamiento" {
  name                  = "historias-clinicas"
  storage_account_name  = azurerm_storage_account.almacenamiento.name
  container_access_type = "private"
}

    

resource "azurerm_storage_blob" "blob-almacenamiento" {
  name                   = "almacenamiento-historias-clinicas"
    storage_account_name   = azurerm_storage_account.almacenamiento.name
    storage_container_name = azurerm_storage_container.container-almacenamiento.name
  type                   = "Block"
}



resource "azurerm_cosmosdb_account" "cosmos" {
  name                = "hccosmosdb"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  offer_type          = "Standard"
  kind                = "MongoDB" 

  consistency_policy {
    consistency_level = "Session"
  }

  geo_location {
    location          = azurerm_resource_group.rg.location
    failover_priority = 0
  }

  capabilities {
    name = "EnableMongo"
  }

   tags = {
    environment = "Development"
    project     = "Projecto_inicial"
    name        = "cosmosdb"
  }
}



# Servidor SQL (versión gratuita para estudiantes)
resource "azurerm_mssql_server" "sql_server" {
  name                         = "hcsqlserver"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "P@ssw0rd123!" 
  minimum_tls_version = "1.2"

  tags = {
    environment = "Development"
    project     = "Projecto_inicial"
    name        = "sql_server"
  }
}

# Base de datos SQL (SKU gratuita para estudiantes)
resource "azurerm_mssql_database" "sql_db" {
  name      = "hc-sqldb"
  server_id = azurerm_mssql_server.sql_server.id
  sku_name  = "Basic"
  max_size_gb = 2

  tags = {
    environment = "Development"
    project     = "Projecto_inicial"
    name        = "sql_database"
  }
}