variable "tenant_id" {
  description = "The Tenant ID for the Azure Active Directory."
  type        = string
  sensitive   = true
  

}

variable "subscription_id" {
  description = "The Subscription ID for the Azure subscription."
  type        = string
  sensitive   = true
  

}

variable "resource_group_name" {
  description = "The name of the resource group to create."
  type        = string
  default     = "myResourceGroup"
}

variable "location" {
  description = "The Azure region where the resources will be created."
  type        = string
  default     = "eastus"
}
#--

variable "owner_object_id" {
  description = "Object ID of the owner in Azure AD."
  type        = string
  sensitive   = true
  default       = "123e4567-e89b-12d3-a456-426614174000" # Reemplazar con el Object ID real
}

variable "dev_team_object_id" {
  description = "Object ID of the development team in Azure AD."
  type        = string
  sensitive   = true
  default       = "123e4567-e89b-12d3-a456-4266141740002" # Reemplazar con el Object ID real
}

variable "ops_team_object_id" {
  description = "Object ID of the operations team in Azure AD."
  type        = string
  sensitive   = true
  default       = "123e4567-e89b-12d3-a456-4266141740003" # Reemplazar con el Object ID real
}

variable "audit_team_object_id" {
  description = "Object ID of the audit team in Azure AD."
  type        = string
  sensitive   = true
  default       = "123e4567-e89b-12d3-a456-4266141740004" # Reemplazar con el Object ID real
}

variable "db_admin_object_id" {
  description = "Object ID of the database administrator in Azure AD."
  type        = string
  sensitive   = true
  default       = "123e4567-e89b-12d3-a456-4266141740005" # Reemplazar con el Object ID real
}

variable "app_service_object_id" {
  description = "Object ID of the app service in Azure AD."
  type        = string
  sensitive   = true
  default       = "123e4567-e89b-12d3-a456-4266141740006" # Reemplazar con el Object ID real
}

