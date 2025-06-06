# locals to construct the resource ID of side car vnet, not required if side car vnet is exported as output
locals {
  connectivity_subscription_id = "0fb0d3b2-5b3a-4db0-8e5e-d5459592651d"
  hub_resource_group_name      = "rgbdo7-hub1-southeastasia"
  sidecar_vnet_name            = "bdo7vnet-sidecar1-southeastasia"
}


# peer primary sidecar to primary VWAN hub
resource "azurerm_virtual_hub_connection" "primary_sidecar_to_primary_vhub" {
  provider                  = azurerm.connectivity
  name                      = "pri-sidecar-vhub-connection"
  virtual_hub_id            = virtual_wan_virtual_hub_resource_ids["primary"]
  remote_virtual_network_id = "/subscriptions/${local.connectivity_subscription_id}/resourceGroups/${local.hub_resource_group_name}/providers/Microsoft.Network/virtualNetworks/${local.sidecar_vnet_name}"
}



# peer secondary sidecar to secondary VWAN hub