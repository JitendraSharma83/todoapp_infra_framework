terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.51.0"
    }
  }
}

provider "azurerm" {
    features {}
  subscription_id = "19daee92-d877-4443-a867-a4e5a2b05fd3"
}