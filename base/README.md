# base

Reusable OpenTofu module for provisioning a GKE cluster on GCP. Used as a module by each lab.

## Variables

| Variable | Default | Description |
|---|---|---|
| `project_id` | — | GCP project ID |
| `region` | — | GCP region |
| `zone` | — | GCP zone (single-zone cluster) |
| `cluster_name` | — | Name of the cluster |
| `machine_type` | `e2-medium` | Node machine type |
| `min_node_count` | `0` | Min nodes (autoscaling) |
| `max_node_count` | `2` | Max nodes (autoscaling) |
| `initial_node_count` | `1` | Starting node count |
| `spot` | `true` | Use spot VMs |
| `disk_size_gb` | `30` | Boot disk size per node |
