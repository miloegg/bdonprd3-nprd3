resource "azurerm_subnet" "nprd_dns_inbound_subnet" {
  provider             = azurerm.connectivity
  name                 = "nprd-dns-inbound-subnet"
  resource_group_name  = "rgbdo7-hub1-southeastasia"
  virtual_network_name = "bdo7vnet-sidecar1-southeastasia"
  address_prefixes     = ["10.0.4.80/28"]
}