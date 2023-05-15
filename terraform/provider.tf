terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.64.0"
    }
  }
  backend "gcs" {
    bucket  = "fun-with-gcp-tf"
  }
}

provider "google" {
  project     = var.GCP_PROJECT_ID
  region      = var.GCP_PROJECT_REGION
}

# Retrieve an access token as the Terraform runner
data "google_client_config" "provider" {}
