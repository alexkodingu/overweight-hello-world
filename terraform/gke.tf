# GKE cluster
resource "google_container_cluster" "my_cluster" {
  name     = "${var.GCP_PROJECT_ID}-gke"
  location = var.gke_location
  
  remove_default_node_pool = true
  initial_node_count       = 1

  network    = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name
}

#data "google_service_account" "default" {
#  account_id = "1069431788478-compute@developer.gserviceaccount.com"
#}

# Separately Managed Node Pool
resource "google_container_node_pool" "my_nodes" {
  name       = google_container_cluster.my_cluster.name
  cluster    = google_container_cluster.my_cluster.name
  node_count = var.gke_num_nodes

  location = var.gke_location

  node_config {
#    oauth_scopes = [
#      "https://www.googleapis.com/auth/logging.write",
#      "https://www.googleapis.com/auth/monitoring",
#    ]

    labels = {
      env = var.GCP_PROJECT_ID
    }

#    service_account = data.google_service_account.default.email

    machine_type = var.gke_node_type
    disk_size_gb = var.gke_node_disk
    tags         = ["gke-node", "${var.GCP_PROJECT_ID}-gke"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}
