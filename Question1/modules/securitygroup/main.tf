# Creating tags as local variable
locals {
  tags = {
    ProjectName        = var.ProjectName
    Department         = var.Department
    Criticality        = var.Criticality
  }
}

resource "azurerm_network_security_group" "web-nsg" {
  name                = var.web_nsg 
  location            = var.location
  resource_group_name = var.resource_group_name
  
  security_rule {
    name                       = "ssh-rule-1"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_address_prefix      = "*"
    source_port_range          = "*"
    destination_address_prefix = "*"
    destination_port_range     = "22"
  }
  
  security_rule {
    name                       = "ssh-rule-2"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "Tcp"
    source_address_prefix      = "172.158.3.0/24"
    source_port_range          = "*"
    destination_address_prefix = "*"
    destination_port_range     = "22"
}
}

resource "azurerm_subnet_network_security_group_association" "web-nsg-subnet" {
  subnet_id                 = var.web_subnet_id
  network_security_group_id = azurerm_network_security_group.web-nsg.id
}


resource "azurerm_network_security_group" "app-nsg" {
    name = var.app_nsg
    location = var.location
    resource_group_name = var.resource_group_name

    security_rule {
        name = "ssh-rule-1"
        priority = 100
        direction = "Inbound"
        access = "Allow"
        protocol = "Tcp"
        source_address_prefix = "172.158.1.0/24"
        source_port_range = "*"
        destination_address_prefix = "*"
        destination_port_range = "22"
    }
    
    security_rule {
        name = "ssh-rule-2"
        priority = 101
        direction = "Outbound"
        access = "Allow"
        protocol = "Tcp"
        source_address_prefix = "172.158.1.0/24"
        source_port_range = "*"
        destination_address_prefix = "*"
        destination_port_range = "22"
    }
}

resource "azurerm_subnet_network_security_group_association" "app-nsg-subnet" {
  subnet_id                 = var.app_subnet_id
  network_security_group_id = azurerm_network_security_group.app-nsg.id
}