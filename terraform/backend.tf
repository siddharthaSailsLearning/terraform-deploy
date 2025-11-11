terraform {
  required_version = ">= 1.5.0"

  backend "gcs" {
    bucket = "placeholder-bucket-overrided-by-cipipeline"
    prefix = "placeholder-prefix-overrided-by-cipipeline"
  }
}
