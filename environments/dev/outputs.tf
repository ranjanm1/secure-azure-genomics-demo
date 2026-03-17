output "resource_group_name" {
  value = module.resource_group.resource_group_name
}

output "vnet_name" {
  value = module.networking.vnet_name
}

output "vnet_id" {
  value = module.networking.vnet_id
}

output "app_subnet_id" {
  value = module.networking.app_subnet_id
}

output "data_subnet_id" {
  value = module.networking.data_subnet_id
}

output "private_endpoint_subnet_id" {
  value = module.networking.private_endpoint_subnet_id
}

output "log_analytics_workspace_name" {
  value = module.log_analytics.workspace_name
}

output "storage_account_name" {
  value = module.storage.storage_account_name
}

output "storage_account_id" {
  value = module.storage.storage_account_id
}

output "key_vault_name" {
  value = module.key_vault.key_vault_name
}

output "key_vault_id" {
  value = module.key_vault.key_vault_id
}

output "key_vault_uri" {
  value = module.key_vault.key_vault_uri
}

output "storage_private_endpoint_id" {
  value = module.private_endpoints.storage_private_endpoint_id
}

output "key_vault_private_endpoint_id" {
  value = module.private_endpoints.key_vault_private_endpoint_id
}

output "blob_private_dns_zone_name" {
  value = module.private_endpoints.blob_private_dns_zone_name
}

output "key_vault_private_dns_zone_name" {
  value = module.private_endpoints.key_vault_private_dns_zone_name
}

output "key_vault_diagnostic_setting_id" {
  value = module.diagnostics.key_vault_diagnostic_setting_id
}

output "storage_blob_diagnostic_setting_id" {
  value = module.diagnostics.storage_blob_diagnostic_setting_id
}

output "data_factory_name" {
  value = module.data_factory.data_factory_name
}

output "data_factory_id" {
  value = module.data_factory.data_factory_id
}

output "data_factory_principal_id" {
  value = module.data_factory.data_factory_principal_id
}