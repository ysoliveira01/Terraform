provider "google" {
  project = "civic-replica-408912"
  #  region      = "us-central1"
}

provider "kubernetes" {
  #  source  = "hashicorp/kubernetes"
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}
