terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.64.0"
    }
  }
}

provider "azurerm" {
  features {}
tenant_id = var.tenant_id
subscription_id = var.subscription_id
skip_provider_registration = true
}