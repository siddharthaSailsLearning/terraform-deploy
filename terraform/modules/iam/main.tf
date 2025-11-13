# resource "google_service_account" "deployer" {
#   account_id   = "deployer-sa"
#   display_name = "Deployer service account for GKE & Artifact Registry"
# }

# Bindings: least-privilege set for common operations.
resource "google_project_iam_member" "container_admin" {
  project = var.project_id
  role    = "roles/container.admin"
  member  = "serviceAccount:${var.service_ACC}"
}

resource "google_project_iam_member" "artifact_registry_admin" {
  project = var.project_id
  role    = "roles/artifactregistry.writer"
  member  = "serviceAccount:${var.service_ACC}"
}

# If needed: grant storage permissions for pushing images to older registries
resource "google_project_iam_member" "storage_admin_for_images" {
  project = var.project_id
  role    = "roles/storage.admin"
  member  = "serviceAccount:${var.service_ACC}"
}
