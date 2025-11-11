variable "project_id" {
  type        = string
  description = "GCP project ID"
}

variable "prefix" {
  type        = string
  description = "GCP prefix"
}

variable "region" {
  type        = string
  description = "GCP region"
  default     = "us-central1"
}

variable "bucket_name" {
  type        = string
  description = "Name of the GCS bucket"
}

variable "credentials_path" {
  type        = string
  description = "Path to the service account credentials JSON file"
}