variable "location" {
  type        = string
  description = "location where resource needs to be provisioned."
}

variable "resource_group_name" {
  type        = string
  default     = "lab_rg"
  description = "The name of the Resource Group in which the resource should be exist."
}

variable "vnet_name" {
  type        = string
  default     = "lab-vnet"
  description = "Provide list of maps of vnets to be created."
}

variable "web_vnet_name" {
  type        = string
  default     = "lab-web-subnet"
  description = "Provide list of maps of subnets to be created."
}

variable "app_vnet_name" {
  type        = string
  default     = "lab-app-subnet"
  description = "Provide list of maps of subnets to be created."
}

variable "db_vnet_name" {
  type        = string
  default     = "lab-db-subnet"
  description = "Provide list of maps of subnets to be created."
}

variable "vnetcidr" {
  type        = list(any)
  default     = ["172.158.0.0/16"]
  description = "Provide list of vnets to be created."  
}

variable "websubnetcidr" {
  type        = list(any)
  default     = ["172.158.1.0/24"]
  description = "Provide list of web subnets to be created."
}

variable "appsubnetcidr" {
  type        = list(any)
  default     = ["172.158.2.0/24"]
  description = "Provide list of app subnets to be created."
}

variable "dbsubnetcidr" {
  type        = list(any)
  default     = ["172.158.3.0/24"]
  description = "Provide list of db subnets to be created."
}

variable "ProjectName" {
  type        = string
  default     = "labproject"
  description = "Project Name for Tag"
}

variable "Department" {
  type        = string
  default     = "labdepartment"
  description = "Department for Tag"
}

variable "Criticality" {
  type        = string
  default     = "medium"
  description = "Criticality for Tag"
}