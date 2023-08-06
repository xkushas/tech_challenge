# Creating tags as local variable
locals {
  tags = {
    ProjectName        = var.ProjectName
    Department         = var.Department
    Criticality        = var.Criticality
  }
}

# Virtual network creation
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.vnetcidr
  tags                = local.tags
}

# Subnet creation
resource "azurerm_subnet" "web-subnet" {
  name                 = var.web_vnet_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = var.resource_group_name
  address_prefixes     = var.websubnetcidr
}

resource "azurerm_subnet" "app-subnet" {
  name                 = var.app_vnet_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = var.resource_group_name
  address_prefixes     = var.appsubnetcidr
}

resource "azurerm_subnet" "db-subnet" {
  name                 = var.db_vnet_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = var.resource_group_name
  address_prefixes     = var.dbsubnetcidr
}