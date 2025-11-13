resource "google_artifact_registry_repository" "my-docker-repo" {
  provider      = google-beta
  project       = var.project_id
  location      = var.reg
  repository_id = var.repository_id
  format        = "DOCKER"
  description   = "Docker repo for apps"
}
