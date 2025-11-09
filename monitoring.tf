

resource "azurerm_log_analytics_workspace" "log_analytics" {
  name                = "hc-log-analytics"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30

  tags = {
    environment = "Development"
    service     = "Monitoring"
  }
}




# # 2. Application Insights
# resource "azurerm_application_insights" "app_insights" {
#   name                = "hc-app-insights"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
#   application_type    = "web"

#   tags = {
#     environment = "Development"
#     service     = "Monitoring"
#   }
# }



 #3. Integración con App Service
resource "azurerm_app_service" "app" {
  name                = "hc-webapp"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
    app_service_plan_id = azurerm_service_plan.plan.id

  # app_settings = {
  #    "APPINSIGHTS_INSTRUMENTATIONKEY" = azurerm_application_insights.app_insights.instrumentation_key
  #  }


}



# 4. Configuración de diagnóstico para App Service
resource "azurerm_monitor_diagnostic_setting" "app_diag" {
  name                       = "appservice-diagnostics"
  target_resource_id         = azurerm_app_service.app.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.log_analytics.id

  # enabled_metric {
  #   category = "AllMetrics"
  # }

  enabled_log {
    category = "AppServiceHTTPLogs"
  }



  
  }



 #5. Configuración de diagnóstico para Storage Account
resource "azurerm_monitor_diagnostic_setting" "storage_diag" {
  name                       = "storage-diagnostics"
  target_resource_id         = azurerm_storage_account.almacenamiento.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.log_analytics.id

  # enabled_metric {
  #   category = "Transaction"
  # }

  enabled_log {
    category = "StorageRead"
    
  }

  enabled_log {
    category = "StorageWrite"
   
  }
}



# 6. Configuración de diagnóstico para SQL Database
resource "azurerm_monitor_diagnostic_setting" "sql_diag" {
  name                       = "sqldb-diagnostics"
  target_resource_id         = azurerm_mssql_server.sql_server.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.log_analytics.id

  # enabled_metric {
  #   category = "Basic"
  # }

  enabled_log {
    category = "SQLSecurityAuditEvents"
    
  }
  
}



# 7. Configuración de diagnóstico para Cosmos DB
resource "azurerm_monitor_diagnostic_setting" "cosmos_diag" {
  name                       = "cosmosdb-diagnostics"
  target_resource_id         = azurerm_cosmosdb_account.cosmos.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.log_analytics.id

  # enabled_metric {
  #   category = "Requests"
  # }

  enabled_log {
    category = "DataPlaneRequests"
    
  }
}
