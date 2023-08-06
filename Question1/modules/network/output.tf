output "network_name" {
  value = azurerm_virtual_network.vnet.name
  description = "Name of the Virtual network"
}

output "websubnet_id" {
  value = azurerm_subnet.web-subnet.id
  description = "Id of web-subnet in the network"
}

output "appsubnet_id" {
  value = azurerm_subnet.app-subnet.id
  description = "Id of app-subnet in the network"
}

output "dbsubnet_id" {
  value = azurerm_subnet.db-subnet.id
  description = "Id of db-subnet in the network"
}