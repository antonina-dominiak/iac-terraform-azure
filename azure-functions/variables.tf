variable "resource_group_name" {
  description = "rg name"
  type        = string
}

variable "resource_group_location" {
  description = "rg location"
  type        = string
}

variable "storage_account_name" {
  description = "storage account name"
  type        = string
}

variable "storage_account_tier" {
  description = "storage account tier"
  type        = string
}

variable "storage_account_replication_type" {
  description = "storage account replication type"
  type        = string
}

variable "app_service_plan_name" {
  description = "app service plan name"
  type        = string
}

variable "app_service_plan_tier" {
  description = "app service plan tier."
  type        = string
}

variable "app_service_plan_size" {
  description = "app service plan size"
  type        = string
}