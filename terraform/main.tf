provider "google" {
  project = var.project_id
  region  = var.region
  # When running in CI we use GOOGLE_APPLICATION_CREDENTIALS env var
}




provider "google-beta" {
  project = var.project_id
  region  = var.region
}

# IAM module - creates service account + required IAM bindings for GKE & GAR
module "iam" {
  source = "./modules/iam"
  project_id = var.project_id
  service_ACC = var.service_ACC
}

# Artifact Registry
module "gar" {
  source = "./modules/gar"
  project_id = var.project_id
  region     = var.region
  repository_id = "my-docker-repo"
}

# GKE
module "gke" {
  source = "./modules/gke"
  project_id   = var.project_id
  region       = var.region
  cluster_name = var.cluster_name
  node_count   = var.gke_node_count
  machine_type = var.gke_machine_type
  service_account_email = module.iam.service_account_email
}
