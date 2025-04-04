variable "subscription_id" {
  description = "The ID of the Azure subscription where the resources will be created."
  type        = string
}

variable "project_name" {
  description = "The name of the resource group where the resources will be created."
  type        = string
  default = "expertostf"
}

variable "environment" {
  description = "The environment for the resources (e.g., dev, test, prod)."
  type        = string
  default     = "dev"
}

variable "location" {
  description = "The Azure region where the resources will be created."
  type        = string
  default     = "Central US"
}

variable "tags" {
  description = "Tags to be applied to the resources."
  type        = map(string)
  default     = {
    Environment = "dev"
    date = "abril-2025"
    Owner       = "CarlosAmaya"
  }
}

variable "sqladminpassword" {
  description = "The password for the SQL Server administrator."
  type        = string
}

variable "sqladminusername" {
  description = "The username for the SQL Server administrator."
  type        = string
}