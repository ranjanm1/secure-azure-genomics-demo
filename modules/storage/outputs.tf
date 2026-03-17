output "storage_account_id" {
  value = azurerm_storage_account.adls.id
}

output "storage_account_name" {
  value = azurerm_storage_account.adls.name
}

output "primary_blob_endpoint" {
  value = azurerm_storage_account.adls.primary_blob_endpoint
}