
# ------------------------------------------------------------
# 1. Role Assignment: Owner (control total sobre el grupo de recursos)
# ------------------------------------------------------------
resource "azurerm_role_assignment" "owner_assignment" {
  scope                = azurerm_resource_group.rg.id
  role_definition_name = "Owner"
  principal_id         = var.owner_object_id # Object ID del administrador en Azure AD
}

# ------------------------------------------------------------
# 2. Role Assignment: Contributor (gestión de recursos sin asignar permisos)
# ------------------------------------------------------------
resource "azurerm_role_assignment" "contributor_assignment" {
  scope                = azurerm_resource_group.rg.id
  role_definition_name = "Contributor"
  principal_id         = var.dev_team_object_id # Object ID del equipo de desarrollo
}

# ------------------------------------------------------------
# 3. Role Assignment: Storage Blob Data Contributor (acceso a blobs)
# ------------------------------------------------------------
resource "azurerm_role_assignment" "blob_data_contributor" {
  scope                = azurerm_storage_account.almacenamiento.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = var.ops_team_object_id # Object ID del equipo de operaciones
}

# ------------------------------------------------------------
# 4. Role Assignment: Cosmos DB Account Reader (solo lectura en Cosmos DB)
# ------------------------------------------------------------
resource "azurerm_role_assignment" "cosmos_reader" {
  scope                = azurerm_cosmosdb_account.cosmos.id
  role_definition_name = "Cosmos DB Account Reader Role"
  principal_id         = var.audit_team_object_id # Object ID del equipo auditor
}

# ------------------------------------------------------------
# 5. Role Assignment: SQL DB Contributor (gestión de bases SQL)
# ------------------------------------------------------------
resource "azurerm_role_assignment" "sql_contributor" {
  scope                = azurerm_mssql_server.sql_server.id
  role_definition_name = "SQL DB Contributor"
  principal_id         = var.db_admin_object_id # Object ID del administrador de BD
}

# ------------------------------------------------------------
# 6. Role Assignment: Key Vault Secrets User (lectura de secretos)
# ------------------------------------------------------------
resource "azurerm_role_assignment" "keyvault_secrets_user" {
  scope                = azurerm_resource_group.rg.id # Usar el scope del grupo de recursos temporalmente hasta agregar azurerm_key_vault.kv
  role_definition_name = "Key Vault Secrets User"
  principal_id         = var.app_service_object_id # Object ID del servicio que accede a secretos
}
