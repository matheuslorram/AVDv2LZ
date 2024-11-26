output "storage_account_name" {
  description = "Storage account for Profiles"
  value       = azurerm_storage_account.storage.name
}

output "storage_account_share" {
  description = "Name of the Azure File Share created for FSLogix"
  value       = azurerm_storage_share.FSShare.name
}
output "storage_account_id" {
  description = "Storage account ID"
  value       = azurerm_storage_account.storage.id
  
}