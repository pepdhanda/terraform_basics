# Output the storage account name
output "storage_account_name" {
  description = "The name of the storage account"
  value       = azurerm_storage_account.example.name
}

# Output the storage account primary connection string
output "storage_account_connection_string" {
  description = "The primary connection string for the storage account"
  value       = azurerm_storage_account.example.primary_connection_string
  sensitive   = true
}

# Output the storage account primary access key
output "storage_account_primary_access_key" {
  description = "The primary access key for the storage account"
  value       = azurerm_storage_account.example.primary_access_key
  sensitive   = true
}

# Output the blob endpoint
output "storage_account_blob_endpoint" {
  description = "The blob service endpoint URL"
  value       = azurerm_storage_account.example.primary_blob_endpoint
}

# Output the container names
output "container_names" {
  description = "The names of the created blob containers"
  value       = [for container in azurerm_storage_container.containers : container.name]
}

# Output the resource group name
output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.example.name
}
