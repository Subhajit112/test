terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "9c8cf6ce-bd20-48aa-ab52-97366710f7a9"
  tenant_id       = "67c85ae4-de6d-4883-8bf0-5899f319d7a0"
}
