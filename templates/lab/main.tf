terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

module "cluster" {
  source = "../../base"

  project_id   = var.project_id
  region       = var.region
  zone         = var.zone
  cluster_name = "LAB_NAME"
  machine_type = var.machine_type
}
