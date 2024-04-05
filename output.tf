output "azurerm_container_app_back_url" {
  value = azurerm_container_app.container_app_back.latest_revision_fqdn
}

output "azurerm_container_app_front_url" {
  value = azurerm_container_app.container_app_front.latest_revision_fqdn
}