terraform {
  backend "azurerm" {
    resource_group_name  = var.azurerm_resource_group.rg
    storage_account_name = azurerm_storage_account.mystorage.name
    container_name       = azurerm_storage_container.tfstate.name
    key                  = "test.terraform.tfstate"
  }
}
