output "storage_private_endpoint_id" {
  value = azurerm_private_endpoint.storage_blob.id
}

output "key_vault_private_endpoint_id" {
  value = azurerm_private_endpoint.keyvault.id
}

output "blob_private_dns_zone_name" {
  value = azurerm_private_dns_zone.blob.name
}

output "key_vault_private_dns_zone_name" {
  value = azurerm_private_dns_zone.keyvault.name
}