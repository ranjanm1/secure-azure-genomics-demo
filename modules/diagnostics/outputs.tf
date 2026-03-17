output "key_vault_diagnostic_setting_id" {
  value = azurerm_monitor_diagnostic_setting.key_vault.id
}

output "storage_blob_diagnostic_setting_id" {
  value = azurerm_monitor_diagnostic_setting.storage_blob.id
}