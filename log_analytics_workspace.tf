resource "azurerm_log_analytics_workspace" "analytics_workspace" {
  name                = var.logs-ws
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}