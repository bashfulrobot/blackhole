variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "zone" {
  description = "GCP zone for the single-zone cluster"
  type        = string
}

variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
}

variable "machine_type" {
  description = "Machine type for the node pool"
  type        = string
  default     = "e2-medium"
}

variable "min_node_count" {
  description = "Minimum number of nodes in the pool"
  type        = number
  default     = 0
}

variable "max_node_count" {
  description = "Maximum number of nodes in the pool"
  type        = number
  default     = 2
}

variable "initial_node_count" {
  description = "Initial number of nodes in the pool"
  type        = number
  default     = 1
}

variable "spot" {
  description = "Use spot (preemptible) VMs"
  type        = bool
  default     = true
}

variable "disk_size_gb" {
  description = "Boot disk size in GB for each node"
  type        = number
  default     = 30
}

variable "kubernetes_version" {
  description = "Kubernetes version (leave null for default)"
  type        = string
  default     = null
}
