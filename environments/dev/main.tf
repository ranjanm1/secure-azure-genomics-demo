resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.project_name}-${var.environment}"
  location = var.location
}

module "resource_group" {
  source = "../../modules/resource_group"

  project_name = var.project_name
  environment  = var.environment
  location     = var.location
}

module "networking" {
  source = "../../modules/networking"

  project_name                   = var.project_name
  environment                    = var.environment
  location                       = var.location
  resource_group_name            = module.resource_group.resource_group_name
  vnet_address_space             = var.vnet_address_space
  app_subnet_prefix              = var.app_subnet_prefix
  data_subnet_prefix             = var.data_subnet_prefix
  private_endpoint_subnet_prefix = var.private_endpoint_subnet_prefix
}

module "log_analytics" {
  source = "../../modules/log_analytics"

  project_name        = var.project_name
  environment         = var.environment
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
}

module "storage" {
  source = "../../modules/storage"

  project_name         = var.project_name
  environment          = var.environment
  location             = var.location
  resource_group_name  = module.resource_group.resource_group_name
  storage_account_name = var.storage_account_name
  containers = [
    "raw",
    "curated",
    "audit",
    "reference"
  ]
}

module "key_vault" {
  source = "../../modules/key_vault"

  project_name        = var.project_name
  environment         = var.environment
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
  tenant_id           = var.tenant_id
}

module "private_endpoints" {
  source = "../../modules/private_endpoints"

  project_name               = var.project_name
  environment                = var.environment
  location                   = var.location
  resource_group_name        = module.resource_group.resource_group_name
  vnet_id                    = module.networking.vnet_id
  private_endpoint_subnet_id = module.networking.private_endpoint_subnet_id

  storage_account_id   = module.storage.storage_account_id
  storage_account_name = module.storage.storage_account_name

  key_vault_id   = module.key_vault.key_vault_id
  key_vault_name = module.key_vault.key_vault_name
}

module "diagnostics" {
  source = "../../modules/diagnostics"

  project_name               = var.project_name
  environment                = var.environment
  key_vault_id               = module.key_vault.key_vault_id
  storage_account_id         = module.storage.storage_account_id
  log_analytics_workspace_id = module.log_analytics.workspace_id
}

module "data_factory" {
  source = "../../modules/data_factory"

  project_name        = var.project_name
  environment         = var.environment
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
}