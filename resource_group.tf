resource "azurerm_resource_group" "resource_group" {
  name     = var.rg
  location = var.location
}