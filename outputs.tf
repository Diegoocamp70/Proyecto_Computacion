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
output "provider-version" {
  value       = azurerm.provider.version
  description = "The version of the AzureRM provider."
}

