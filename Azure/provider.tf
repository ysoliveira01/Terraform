terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

provider "azurerm" {
  features {}
  #client_id       = ""
  #client_secret   = ""
  #subscription_id = ""
}

terraform {
  backend "azurerm" {
    resource_group_name  = "AKS-IAC"
    storage_account_name = "satfstateaks"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}