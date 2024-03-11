resource "kubernetes_namespace_v1" "kubewatch" {
  metadata {
    name = "kubewatch"
    labels = {
      name = "kubewatch"
    }
  }
  #    lifecycle {
  #        ignore_changes = [metadata[0].annotations]
  #  }
}

resource "helm_release" "kubewatch" {
  name       = local.prefix
  repository = "https://robusta-charts.storage.googleapis.com"
  chart      = "kubewatch"
  version    = "3.3.10"
  namespace  = kubernetes_namespace_v1.kubewatch.metadata[0].name
  #    lifecycle {
  #        ignore_changes = [repository, metadata]
  #  }
}