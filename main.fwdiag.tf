module "fwdiag" {
  providers = {
    azurerm.connectivity = azurerm.connectivity
  }
  source              = "./modules/diagnostic_settings"
  diagnostic_settings = local.diagnostic_settings
  # target_resource_id  = "/subscriptions/0fb0d3b2-5b3a-4db0-8e5e-d5459592651d/resourceGroups/rgbdo7-hub1-southeastasia/providers/Microsoft.Network/azureFirewalls/bdo7fw-hub1-southeastasia"
  target_resource_id = module.virtual_wan[0].firewall_resource_ids["primary"]
}




locals {
  diagnostic_settings = {
    diag_setting_1 = {
      name                           = "fwdiag"
      log_groups                     = ["allLogs"]
      metric_categories              = ["AllMetrics"]
      log_analytics_destination_type = "Dedicated"
      # workspace_resource_id          = "/subscriptions/1543411c-a55d-46d6-93bf-2e585fd51376/resourceGroups/rgbdo7-management-southeastasia/providers/Microsoft.OperationalInsights/workspaces/bdo7law-management-southeastasia"
      # workspace_resource_id = module.config.management_group_settings.policy_default_values.log_analytics_workspace_id
      # adjusted output due to API case sensitive bug expecting resourceGroups instead of resourcegroups
      workspace_resource_id = replace(module.config.management_group_settings.policy_default_values.log_analytics_workspace_id, "resourcegroups", "resourceGroups")
    }
  }
}  