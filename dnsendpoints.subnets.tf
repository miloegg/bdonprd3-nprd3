resource "azurerm_subnet" "nprd_dns_inbound_subnet" {
  name                 = "nprd-dns-inbound-subnet"
  resource_group_name  = var.custom_replacements.names.connectivity_hub_primary_resource_group_name
  virtual_network_name = var.custom_replacements.names.primary_sidecar_virtual_network_name
  address_prefixes     = ["10.0.4.80/28"]
}