output "cluster_name" {
  description = "The name of the GKE cluster"
  value       = google_container_cluster.lab.name
}

output "cluster_endpoint" {
  description = "The endpoint of the GKE cluster"
  value       = google_container_cluster.lab.endpoint
  sensitive   = true
}

output "cluster_ca_certificate" {
  description = "The CA certificate of the GKE cluster"
  value       = google_container_cluster.lab.master_auth[0].cluster_ca_certificate
  sensitive   = true
}

output "zone" {
  description = "The zone of the GKE cluster"
  value       = google_container_cluster.lab.location
}

output "project_id" {
  description = "The project ID"
  value       = var.project_id
}
