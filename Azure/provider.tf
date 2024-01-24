terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.25.0"
    }

    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.14.0a"
    }
  }
}

provider "azurerm" {
  features {}
  #client_id       = ""
  #client_secret   = ""
  #subscription_id = ""
  #tenant_id = ""
}

terraform {
  backend "azurerm" {
    resource_group_name  = "AKS-IAC"
    storage_account_name = "satfstateaks"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}