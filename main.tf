# Configure the Azure Provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

# Create a storage account
resource "azurerm_storage_account" "example" {
  name                     = "${var.storage_account_prefix}${random_string.suffix.result}"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  tags = {
    environment = var.environment
    purpose     = var.purpose
  }
}

# Create a random string for unique storage account name
resource "random_string" "suffix" {
  length  = 8
  special = false
  upper   = false
}

# Create storage containers dynamically
resource "azurerm_storage_container" "containers" {
  for_each              = toset(var.container_names)
  name                  = each.value
  storage_account_id    = azurerm_storage_account.example.id
  container_access_type = var.container_access_type
}
