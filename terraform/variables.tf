variable "project_id" {
  type = string
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "cluster_name" {
  type    = string
  default = "my-gke-cluster"
}

variable "gke_node_count" {
  type    = number
  default = 1
}

variable "gke_machine_type" {
  type    = string
  default = "e2-medium"
}
