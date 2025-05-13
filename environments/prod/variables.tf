variable "resource_group_name" {
  description = "The name of the resource group for the production environment."
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be deployed."
  type        = string
  default     = "East US"
}

variable "app_service_plan_sku" {
  description = "The SKU for the App Service Plan."
  type        = string
  default     = "S1"
}

variable "database_name" {
  description = "The name of the production database."
  type        = string
}