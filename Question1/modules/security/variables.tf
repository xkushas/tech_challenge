variable "resource_group_name" {
  type        = string
  default     = "lab_rg"
  description = "The name of the Resource Group in which the Linux Virtual Machine should be exist."
}

variable "web_nsg" {
  type        = string
  default     = "web-nsg"
  description = "The name of the Network Security Group in which the Web Linux Virtual Machine should reside upon."
}

variable "app_nsg" {
  type        = string
  default     = "app-nsg"
  description = "The name of the Network Security Group in which the App Linux Virtual Machine should reside upon."
}

variable "location" {
  type        = string
  default     = "eastus"
  description = "The Azure location where the Linux NSG should exist."
}

variable "web_subnet_id" {
  type        = string
  description = "The web subnet ID."
}

variable "app_subnet_id" {
  type        = string
  description = "The app subnet ID."
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
