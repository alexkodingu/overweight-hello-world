# VPC
resource "google_compute_network" "vpc" {
  name                    = "${var.GCP_PROJECT_ID}-vpc"
  auto_create_subnetworks = "false"
}

# Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = "${var.GCP_PROJECT_ID}-subnet"
  region        = var.GCP_PROJECT_REGION
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.10.0.0/24"
}