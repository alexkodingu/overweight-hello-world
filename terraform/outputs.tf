output "docker_repository"{
    description = "docker registry from gcp artifact"
    value       = local.repo_address
}

output "cluster_name"{
    description = "GKE cluster name"
    value       = google_container_cluster.my_cluster.name
}
