# criar o recurso
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

# utilizar recurso ja criado

#data "azurerm_virtual_network" "vnet-gateway" {
#  name = ""
#  resource_group_name = ""
#}

#data "azurerm_subnet" "internal" {
#  name = ""
#  virtual_network_name = ""
#  resource_group_name = ""
#}