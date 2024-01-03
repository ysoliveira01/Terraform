resource "azurerm_resource_group" "lab-aks" {
  name     = var.nome_cluster
  location = var.region
}

resource "azurerm_kubernetes_cluster" "lab" {
  name                = var.nome_cluster
  location            = var.region
  resource_group_name = azurerm_resource_group.lab-aks.name
  dns_prefix          = "exampleaks1"

  default_node_pool {
    name       = "worker"
    node_count = 1
    vm_size    = var.vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Name        = var.nome_cluster
    Description = var.descrição
    Environment = var.environment
    CR          = var.CR
    Squad       = var.Squad
  }

  # service_principal {
  #   client_id = ""
  #   client_secret = ""
  # }
}