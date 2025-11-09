output "region-location" {
  value       = azurerm_resource_group.rg.location
  description = "The location of the resource group."
}
output "resource-group-name" {
  value       = azurerm_resource_group.rg.name
  description = "The name of the resource group."
}
output "resource-group-id" {
  value       = azurerm_resource_group.rg.id
  description = "The ID of the resource group."
}

#---
output "storage-account-type" {
  value       = azurerm_storage_account.almacenamiento.account_tier
  description = "The tier of the storage account."
}
output "cosmosdb-type" {
  value       = azurerm_cosmosdb_account.cosmos.kind
  description = "The kind of the Cosmos DB account."
}


output "presupuesto-mensual" {
  value       = azurerm_consumption_budget_subscription.monthly_budget.amount
  description = "The monthly budget amount set for the subscription."
}
