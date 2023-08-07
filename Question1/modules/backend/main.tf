# Creating tags as local variable
locals {
  tags = {
    ProjectName        = var.ProjectName
    Department         = var.Department
    Criticality        = var.Criticality
  }
}

resource "random_password" "mssql_password" {
  length           = 13
  special          = true
  upper            = true
  lower            = true
  override_special = "_%@+"
}

resource "azurerm_mssql_server" "mssqlserver" {
  name                          = var.mssql_server_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  version                       = var.mssql_server_version
  administrator_login           = var.admin_username
  administrator_login_password  = random_password.mssql_password.result
  minimum_tls_version           = var.minimum_tls_version
  public_network_access_enabled = var.public_network_access_enabled

  tags = local.tags
}

resource "azurerm_mssql_database" "mssqldatabase" {
  name               = var.mssql_database_name
  server_id          = azurerm_mssql_server.mssqlserver.id
  collation          = var.mssql_database_collation
  max_size_gb        = var.mssql_database_max_size_gb
  sku_name           = var.mssql_database_sku_name
  geo_backup_enabled = var.mssql_database_geo_backup_enabled
  zone_redundant     = var.mssql_database_zone_redundant

  tags = local.tags

}