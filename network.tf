
resource "azurerm_virtual_network" "virtual_network" {
  name                = "virtual_network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  tags = {
    environment = "Development"
    project     = "Projecto_inicial"
    name        = "red_virtual"
  }
}

resource "azurerm_subnet" "Machine_subnet" {
  name                 = "Machine_Virtual"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = ["10.0.2.0/24"]


  
}


