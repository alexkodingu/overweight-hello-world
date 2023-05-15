resource "google_artifact_registry_repository" "my_repo" {
  location      = var.GCP_PROJECT_REGION
  repository_id = "repository"
  description   = "my docker repository"
  format        = "DOCKER"
}

locals {
    repo_address="${var.GCP_PROJECT_REGION}-docker.pkg.dev/${var.GCP_PROJECT_ID}/${resource.google_artifact_registry_repository.my_repo.repository_id}"
    #image_name="${local.repo_address}/overweight-hello:${data.local_file.image_version.content}"
}
