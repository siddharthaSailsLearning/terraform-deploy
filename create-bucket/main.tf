provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = file(var.credentials_path)
}

resource "google_storage_bucket" "tf_bucket" {
  name                        = var.bucket_name
  location                    = var.region
  force_destroy               = true
  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }
}

resource "google_service_account" "bucket_admin_sa" {
  account_id   = "bucket-admin"
  display_name = "Bucket Admin Service Account"
}

resource "google_storage_bucket_iam_member" "admin_binding" {
  bucket = google_storage_bucket.tf_bucket.name
  role   = "roles/storage.admin"
  member = "serviceAccount:${google_service_account.bucket_admin_sa.email}"
}