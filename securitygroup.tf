resource "azurerm_network_security_group" "mysg" {
  name                = "mysecuritygroup"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  security_rule {
    name                       = "SSH"
    priority                   = "1001"
    access                     = "Allow"
    protocol                   = "Tcp"
    destination_port_range     = "22"
    destination_address_prefix = "*"
    direction                  = "Inbound"
    source_address_prefix      = "*"
  }
  security_rule {
    name                       = "HTTP"
    priority                   = "1002"
    access                     = "Allow"
    protocol                   = "Tcp"
    destination_port_range     = "80"
    destination_address_prefix = "*"
    direction                  = "Inbound"
    source_address_prefix      = "*"
  }
}

resource "azurerm_network_interface_security_group_association" "association" {
  count                     = length(azurerm_network_interface.mynetworkinterface) # Number of interfaces
  network_interface_id      = azurerm_network_interface.mynetworkinterface[count.index].id
  network_security_group_id = azurerm_network_security_group.mysg.id
}