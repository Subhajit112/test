resource "azurerm_network_interface" "mynetworkinterface" {
  count               = 3
  name                = "mynetworkinterface${count.index + 1}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  ip_configuration {
    name                          = "mynicconfig${count.index + 1}"
    subnet_id                     = azurerm_subnet.mysubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.mypublicip[count.index].id
  }
}