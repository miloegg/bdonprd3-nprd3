resource "azurerm_subnet" "nprd_dns_inbound_subnet" {
  provider             = azurerm.connectivity
  name                 = "nprd-dns-inbound-subnet"
  resource_group_name  = "rgbdo7-hub1-southeastasia"
  virtual_network_name = "bdo7vnet-sidecar1-southeastasia"
  address_prefixes     = ["10.0.4.80/28"]
  delegation {
    name = "dns-inbound-delegation"
    service_delegation {
      name    = "Microsoft.Network/dnsResolvers"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }
}

resource "azurerm_subnet" "nprd_dns_outbound_subnet" {
  provider             = azurerm.connectivity
  name                 = "nprd-dns-outbound-subnet"
  resource_group_name  = "rgbdo7-hub1-southeastasia"
  virtual_network_name = "bdo7vnet-sidecar1-southeastasia"
  address_prefixes     = ["10.0.4.96/28"]
  delegation {
    name = "dns-outbound-delegation"
    service_delegation {
      name    = "Microsoft.Network/dnsResolvers"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }
}