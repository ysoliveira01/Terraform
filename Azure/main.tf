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

  # role_based_access_control {
  #   enabled = true

  #   azure_active_directory {
  #     managed = true
  #     azure_rbac_enable = true
  #   }
  # }

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
  #   client_id     = ""
  #   client_secret = ""
  # }

  # addon_profile {
  #   oms_agent {
  #     enabled                    = true
  #     log_analytics_workspace_id = true
  #   }
  # }

  network_profile {
    load_balancer_sku  = "standard"
    network_plugin     = "kubenet"
    network_policy     = "calico"
    docker_bridge_cidr = "172.17.0.1/16"
    service_cidr       = "192.168.0.0/16"
    dns_service_ip     = "192.168.0.10"
  }

  lifecycle {
    ignore_changes = all
  }
}