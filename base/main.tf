terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }
}

resource "google_container_cluster" "lab" {
  name     = var.cluster_name
  location = var.zone
  project  = var.project_id

  # We manage the node pool separately
  remove_default_node_pool = true
  initial_node_count       = 1

  min_master_version = var.kubernetes_version

  # Cost savings: disable unused addons
  addons_config {
    http_load_balancing {
      disabled = false
    }
    horizontal_pod_autoscaling {
      disabled = true
    }
  }

  # Minimal logging/monitoring to reduce cost
  logging_config {
    enable_components = []
  }

  monitoring_config {
    enable_components = []
  }

  deletion_protection = false
}

resource "google_container_node_pool" "lab_nodes" {
  name     = "${var.cluster_name}-pool"
  location = var.zone
  project  = var.project_id
  cluster  = google_container_cluster.lab.name

  initial_node_count = var.initial_node_count

  autoscaling {
    min_node_count = var.min_node_count
    max_node_count = var.max_node_count
  }

  node_config {
    machine_type = var.machine_type
    disk_size_gb = var.disk_size_gb
    spot         = var.spot

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}
