resource "azurerm_kubernetes_cluster_node_pool" "apps" {
  zones                 = [1, 2, 3]
  enable_auto_scaling   = true
  kubernetes_cluster_id = azurerm_kubernetes_cluster.demo.name
  max_count             = var.max_count
  min_count             = var.min_count
  mode                  = var.mode
  name                  = "apps"
  #  orchestrator_version  = data.azurerm_kubernetes_service_versions.current.latest_version
  os_disk_size_gb = var.os_disk_size_gb
  os_type         = var.os_type
  vm_size         = var.vm_size
  priority        = var.priority
  node_labels = {
    "nodepool-type" = "user"
    "environment"   = var.environment
    "nodepools"     = var.nodepools
    "apps"          = "apps"
  }
  tags = {
    "nodepool-type" = "user"
    "environment"   = var.environment
    "nodepools"     = var.nodepools
    "apps"          = "apps"
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "services" {
  zones                 = [1, 2, 3]
  enable_auto_scaling   = true
  kubernetes_cluster_id = azurerm_kubernetes_cluster.demo.name
  max_count             = var.max_count
  min_count             = var.min_count
  mode                  = var.mode
  name                  = "services"
  #  orchestrator_version  = data.azurerm_kubernetes_service_versions.current.latest_version
  os_disk_size_gb = var.os_disk_size_gb
  os_type         = var.os_type
  vm_size         = var.vm_size
  priority        = var.priority
  node_labels = {
    "nodepool-type" = "user"
    "environment"   = var.environment
    "nodepools"     = var.nodepools
    "services"      = "services"
  }
  tags = {
    "nodepool-type" = "user"
    "environment"   = var.environment
    "nodepools"     = var.nodepools
    "services"      = "services"
  }
}