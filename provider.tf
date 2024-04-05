terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.98.0"
    }
    azapi = {
      source  = "Azure/azapi"
      version = "0.5.0"
    }
  }
}

provider "azurerm" {
  features {}
}