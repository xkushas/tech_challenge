output "web_nsg_details" {
  value = azurerm_network_security_group.web-nsg
}

output "app_nsg_details" {
  value = azurerm_network_security_group.app-nsg
}