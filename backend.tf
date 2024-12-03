terraform {
  backend "azurerm" {
    resource_group_name  = "rg01"
    storage_account_name = "storage"
    container_name       = "tfstate"
    key                  = "test.terraform.tfstate"
  }
}
