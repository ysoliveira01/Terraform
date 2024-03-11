terraform {
  required_version = ">=1.0"

  backend "gcs" {
    bucket = "tf-state-kube"
    prefix = "terraform/state"
  }
}