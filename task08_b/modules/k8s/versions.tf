terraform {

  required_providers {
    kubectl = {
      source  = "alekc/kubectl"
      version = "= 2.1.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.25.0, 3.0.0"
    }
  }
}
