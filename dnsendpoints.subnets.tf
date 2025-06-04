resource "azurerm_subnet" "nprd_dns_inbound_subnet" {
  name                 = "nprd-dns-inbound_subnet"
  resource_group_name  = "rgbdo7-hub1-$${starter_location_01}"
  virtual_network_name = "bdo7vnet-sidecar1-$${starter_location_01}"
  address_prefixes     = ["10.0.4.80/28"]
}