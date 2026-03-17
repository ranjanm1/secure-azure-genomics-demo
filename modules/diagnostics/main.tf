data "azurerm_monitor_diagnostic_categories" "key_vault" {
  resource_id = var.key_vault_id
}

# Inferred Azure child resource ID pattern for Blob service
locals {
  storage_blob_service_id = "${var.storage_account_id}/blobServices/default"
}

data "azurerm_monitor_diagnostic_categories" "storage_blob" {
  resource_id = local.storage_blob_service_id
}

resource "azurerm_monitor_diagnostic_setting" "key_vault" {
  name                       = "diag-kv-${var.project_name}-${var.environment}"
  target_resource_id         = var.key_vault_id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  dynamic "enabled_log" {
    for_each = data.azurerm_monitor_diagnostic_categories.key_vault.log_category_types
    content {
      category = enabled_log.value
    }
  }

  dynamic "metric" {
    for_each = data.azurerm_monitor_diagnostic_categories.key_vault.metrics
    content {
      category = metric.value
      enabled  = true
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "storage_blob" {
  name                       = "diag-stblob-${var.project_name}-${var.environment}"
  target_resource_id         = local.storage_blob_service_id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  dynamic "enabled_log" {
    for_each = data.azurerm_monitor_diagnostic_categories.storage_blob.log_category_types
    content {
      category = enabled_log.value
    }
  }

  dynamic "metric" {
    for_each = data.azurerm_monitor_diagnostic_categories.storage_blob.metrics
    content {
      category = metric.value
      enabled  = true
    }
  }
}