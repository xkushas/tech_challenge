terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.66.0"
    }
  }
}

module "resourcegroup" {
  source         = "./modules/resourcegroup"
}

module "network" {
  source         = "./modules/network"
  location       = module.resourcegroup.location_id
}

module "database" {
  source                    = "./modules/database"
  location                  = module.resourcegroup.location_id
  primary_database_password = var.administrator_login_password
}

module "securitygroup" {
  source         = "./modules/securitygroup"
   web_subnet_id  = module.network.websubnet_id
   app_subnet_id  = module.network.appsubnet_id
   #depends_on = [ module.database ]
   depends_on = [ module.network ]
}

module "compute" {
  source          = "./modules/compute"
  web_subnet_id   = module.network.websubnet_id
  app_subnet_id   = module.network.appsubnet_id
  depends_on = [ module.securitygroup ]
}
