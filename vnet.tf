resource "azurerm_virtual_network" "vNet" {
  name                = "vNet1"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.vnetaddress
  tags = {
    "name" = "myresource"
  }
}