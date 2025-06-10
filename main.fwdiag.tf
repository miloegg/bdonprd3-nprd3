module "fwdiag" {
  providers = {
    azurerm.connectivity = azurerm.connectivity
  }
  source              = "./modules/diagnostic_settings"
  diagnostic_settings = local.diagnostic_settings
  target_resource_id  = "/subscriptions/0fb0d3b2-5b3a-4db0-8e5e-d5459592651d/resourceGroups/rgbdo7-hub1-southeastasia/providers/Microsoft.Network/azureFirewalls/bdo7fw-hub1-southeastasia"
}




locals {
  diagnostic_settings = {
    diag_setting_1 = {
      name                           = "fwdiag"
      log_groups                     = ["allLogs"]
      metric_categories              = ["AllMetrics"]
      log_analytics_destination_type = "Dedicated"
      workspace_resource_id          = "/subscriptions/1543411c-a55d-46d6-93bf-2e585fd51376/resourcegroups/rgbdo7-management-southeastasia/providers/microsoft.operationalinsights/workspaces/bdo7law-management-southeastasia"
    }
  }
}  