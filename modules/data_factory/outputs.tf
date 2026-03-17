output "data_factory_id" {
  value = azurerm_data_factory.adf.id
}

output "data_factory_name" {
  value = azurerm_data_factory.adf.name
}

output "data_factory_principal_id" {
  value = azurerm_data_factory.adf.identity[0].principal_id
}

output "data_factory_tenant_id" {
  value = azurerm_data_factory.adf.identity[0].tenant_id
}