output "cluster_name" {
  value = module.gke.cluster_name
}

output "gar_repo_url" {
  value = module.gar.repository_id
}

output "deployer_service_account" {
  value = module.iam.service_account_email
}
