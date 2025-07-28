# Resource Group Variables
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "rg-terraform-blob-storage"
}

variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
  default     = "East US"
}

# Storage Account Variables
variable "storage_account_prefix" {
  description = "The prefix for the storage account name (will be combined with random suffix)"
  type        = string
  default     = "tfblobstorage"
}

variable "account_tier" {
  description = "The tier of the storage account"
  type        = string
  default     = "Standard"
  validation {
    condition     = contains(["Standard", "Premium"], var.account_tier)
    error_message = "The account_tier must be either Standard or Premium."
  }
}

variable "account_replication_type" {
  description = "The replication type of the storage account"
  type        = string
  default     = "LRS"
  validation {
    condition     = contains(["LRS", "GRS", "RAGRS", "ZRS", "GZRS", "RAGZRS"], var.account_replication_type)
    error_message = "The account_replication_type must be one of: LRS, GRS, RAGRS, ZRS, GZRS, RAGZRS."
  }
}

# Container Variables
variable "container_names" {
  description = "List of container names to create"
  type        = list(string)
  default     = ["terraform-blob-container", "logs", "backups"]
}

variable "container_access_type" {
  description = "The access level of the containers"
  type        = string
  default     = "private"
  validation {
    condition     = contains(["private", "blob", "container"], var.container_access_type)
    error_message = "The container_access_type must be one of: private, blob, container."
  }
}

# Tagging Variables
variable "environment" {
  description = "The environment tag"
  type        = string
  default     = "dev"
}

variable "purpose" {
  description = "The purpose tag"
  type        = string
  default     = "terraform-demo"
}
