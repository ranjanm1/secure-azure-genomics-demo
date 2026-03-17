resource "azurerm_data_factory" "adf" {
  name                = "adf-${var.project_name}-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name

  identity {
    type = "SystemAssigned"
  }
}