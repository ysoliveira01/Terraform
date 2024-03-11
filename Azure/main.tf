resource "azurerm_resource_group" "lab-aks" {
  name     = var.nome_cluster
  location = var.region
}

resource "azurerm_kubernetes_cluster" "lab" {
  name                    = var.nome_cluster
  location                = var.region
  resource_group_name     = azurerm_resource_group.lab-aks.name
  dns_prefix              = "exampleaks1"
  private_cluster_enabled = true

  azure_active_directory_role_based_access_control {
    managed            = true
    azure_rbac_enabled = true
  }

  default_node_pool {
    name           = "worker"
    node_count     = 1
    vm_size        = var.vm_size
    vnet_subnet_id = var.gateway_subnet
  }

  service_principal {
    client_id     = ""
    client_secret = ""
  }

  ingress_application_gateway {
    gateway_name = ""
    subnet_id    = var.gateway_subnet
  }

  tags = {
    Name        = var.nome_cluster
    Description = var.descrição
    Environment = var.environment
    CR          = var.CR
    Squad       = var.Squad
  }

  network_profile {
    load_balancer_sku = "standard"
    network_plugin    = "kubenet"
    network_policy    = "calico"
  }

  lifecycle {
    ignore_changes = all
  }
}