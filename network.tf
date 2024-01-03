resource "azurerm_virtual_network" "vnet-gateway" {
  name                = ""
  location            = var.region
  resource_group_name = ""
  address_space       = [""]

  tags = {
    environment = "app-gateway"
  }
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = ""
  virtual_network_name = ""
  address_prefixes     = [""]
}

# resource "azurerm_subnet" "external" {
#   name                 = "external"
#   resource_group_name  = ""
#   virtual_network_name = ""
#   address_prefixes     = [""]
# }