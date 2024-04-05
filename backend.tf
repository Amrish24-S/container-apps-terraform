terraform {
  backend "azurerm" {
    resource_group_name  = "storage-rg"
    storage_account_name = "terstorage"
    container_name       = "terraform-state-file"
    key                  = "terraform.tfstate"
  }
}