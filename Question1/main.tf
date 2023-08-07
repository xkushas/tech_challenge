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

module "backend" {
  source                    = "./modules/backend"
  location                  = module.resourcegroup.location_id
  primary_database_password = var.administrator_login_password
}

module "security" {
  source         = "./modules/security"
   web_subnet_id  = module.network.websubnet_id
   app_subnet_id  = module.network.appsubnet_id
   depends_on = [ module.network ]
}

module "virtualmachine" {
  source          = "./modules/virtualmachine"
  web_subnet_id   = module.network.websubnet_id
  app_subnet_id   = module.network.appsubnet_id
  depends_on = [ module.security ]
}
