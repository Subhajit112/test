terraform {
  backend "azurerm" {
    resource_group_name  = var.azurerm_resource_group.rg
    storage_account_name = "storage"
    container_name       = "tfstate"
    key                  = "test.terraform.tfstate"
  }
}
