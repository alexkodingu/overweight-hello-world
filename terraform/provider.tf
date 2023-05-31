terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.64.0"
    }
  }
  backend "gcs" {
    bucket  = "replace_by_ci"
  }
}

provider "google" {
  project     = var.GCP_PROJECT_ID
  region      = var.GCP_PROJECT_REGION
}
