# Creating tags as local variable
locals {
  tags = {
    ProjectName        = var.ProjectName
    Department         = var.Department
    Criticality        = var.Criticality
  }
}

resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group_name
  location = var.location
  tags     = local.tags
}