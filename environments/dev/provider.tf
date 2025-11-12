terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.51.0"
    }
  }
    backend "azurerm" {
    resource_group_name  = "todoapprg1"
    storage_account_name = "stgtodoaap123"
    container_name       = "jitu"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
    features {}
  subscription_id = "19daee92-d877-4443-a867-a4e5a2b05fd3"
}