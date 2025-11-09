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
}

variable "dev_team_object_id" {
  description = "Object ID of the development team in Azure AD."
  type        = string
}

variable "ops_team_object_id" {
  description = "Object ID of the operations team in Azure AD."
  type        = string
}

variable "audit_team_object_id" {
  description = "Object ID of the audit team in Azure AD."
  type        = string
}

variable "db_admin_object_id" {
  description = "Object ID of the database administrator in Azure AD."
  type        = string
}

variable "app_service_object_id" {
  description = "Object ID of the app service in Azure AD."
  type        = string
}

