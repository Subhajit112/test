resource "azurerm_resource_group" "rg" {
  name     = "rg01"
  location = var.region
  tags = {
    "name" = "myresource"
  }
}