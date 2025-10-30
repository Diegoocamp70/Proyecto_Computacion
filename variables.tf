variable "tenant_id" {
  description = "The Tenant ID for the Azure Active Directory."
  type        = string
  sensitive   = true
  default = "value"
}

variable "subscription_id" {
  description = "The Subscription ID for the Azure subscription."
  type        = string
  sensitive   = true
  default = "value"
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

