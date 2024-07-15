terraform {
  required_version = ">= 1.3"
  required_providers {

    google = {
      source  = "hashicorp/google"
      version = ">= 5.28, < 6"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 5.28, < 6"
    }
  }

  provider_meta "google" {
    module_name = "blueprints/terraform/terraform-google-memorystore:redis-cluster/v9.0.0"
  }

  provider_meta "google-beta" {
    module_name = "blueprints/terraform/terraform-google-memorystore:redis-cluster/v9.0.0"
  }

}
