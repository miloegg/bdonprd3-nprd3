terraform {
  required_version = "~> 1.9"
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = "~> 4.0"
      configuration_aliases = [azurerm.connectivity]
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}


# diagnostic settings
resource "azurerm_monitor_diagnostic_setting" "this" {
  provider                       = azurerm.connectivity
  for_each                       = var.diagnostic_settings
  name                           = each.value.name != null ? each.value.name : "diag-${var.diag_name}-${index(keys(var.diagnostic_settings), each.key) + 1}"
  target_resource_id             = var.target_resource_id
  storage_account_id             = each.value.storage_account_resource_id
  eventhub_authorization_rule_id = each.value.event_hub_authorization_rule_resource_id
  eventhub_name                  = each.value.event_hub_name
  partner_solution_id            = each.value.marketplace_partner_resource_id
  log_analytics_workspace_id     = each.value.workspace_resource_id
  log_analytics_destination_type = each.value.log_analytics_destination_type

  dynamic "enabled_log" {
    for_each = each.value.log_categories
    content {
      category = enabled_log.value
    }
  }

  dynamic "enabled_log" {
    for_each = each.value.log_groups
    content {
      category_group = enabled_log.value
    }
  }

  dynamic "enabled_metric" {
    for_each = each.value.metric_categories
    content {
      category = enabled_metric.value
    }
  }
}