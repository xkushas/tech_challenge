variable "primary_database_password" {}

variable "mssql_server_name" {
  type        = string
  default     = "labmysql123"
  description = "Microsoft SQL Server name. Globally unique within Azure."
}

variable "resource_group_name" {
  type        = string
  default     = "lab_rg"
  description = "The name of the resource group in which to create the Microsoft SQL Server."
}

variable "location" {
  type        = string
  description = "Specifies the supported Azure location where the resource exists."
}

variable "admin_username" {
  type        = string
  default     = "SqlAdmin"
  description = "The administrator login username for the new server."
  }

variable "administrator_login_password" {
  type        = string
  default     = "A$$dmin@123"
  description = "The administrator login password for the new server."
  }
  
variable "mssql_server_version" {
  type        = string
  default     = "12.0"
  description = "mssql server version"
}

variable "minimum_tls_version" {
  type        = string
  default     = "1.2"
  description = "The Minimum TLS Version for all SQL Database and SQL Data Warehouse databases"
}

variable "public_network_access_enabled" {
  type        = bool
  default     = true
  description = "Whether or not public network access is allowed for this server."
}

variable "mssql_database_name" {
  type        = string
  default     = "testmssqldatabase123"
  description = "Microsoft SQL database name. Globally unique within Azure."
}

variable "mssql_database_collation" {
  type        = string
  default     = "SQL_Latin1_General_CP1_CI_AS"
  description = "Specifies the collation of the database."
}

variable "mssql_database_max_size_gb" {
  type        = number
  default     = 250
  description = "The max size of the database in gigabytes."
}

variable "mssql_database_sku_name" {
  type        = string
  default     = "S1"
  description = "Specifies the name of the sku used by the database."
}

variable "mssql_database_geo_backup_enabled" {
  type        = bool
  default     = false
  description = "Specifies if the Geo Backup Policy is enabled or not."
}

variable "mssql_database_zone_redundant" {
  type        = bool
  default     = false
  description = "Whether this database is zone redundant or not"
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