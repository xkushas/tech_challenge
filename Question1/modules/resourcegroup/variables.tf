variable "resource_group_name" {
  type        = string
  default     = "lab_rg"
  description = "The name of the resource group in which to create the resource."
}

variable "location" {
  type        = string
  default     = "eastus"
  description = "Specifies the Azure location where the resource exists."
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