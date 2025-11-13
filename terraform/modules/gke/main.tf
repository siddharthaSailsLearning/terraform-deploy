resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region

  initial_node_count = var.node_count
  deletion_protection = false
  node_config {
    machine_type    = var.machine_type
    service_account = var.service_account_email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

  release_channel {
    channel = "REGULAR"
  }
}

# optional: create a node pool resource for more control (example)
resource "google_container_node_pool" "primary_nodes" {
  name       = "${var.cluster_name}-pool"
  cluster    = google_container_cluster.primary.name
  location   = var.region
  node_config {
    machine_type = var.machine_type
    service_account = var.service_account_email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

  initial_node_count = var.node_count
}
