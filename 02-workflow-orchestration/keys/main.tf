terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.24.0"
    }
  }
}

provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

data "google_service_account_access_token" "default" {
  provider               = google
  target_service_account = "ny-rides-suchanya@ny-rides-suchanya.iam.gserviceaccount.com"
  scopes                 = ["https://www.googleapis.com/auth/cloud-platform"]
  lifetime               = "3600s"
}

provider "google" {
  alias        = "impersonated"
  access_token = data.google_service_account_access_token.default.access_token
  project      = var.project
  region       = var.region
  zone         = var.zone
}

resource "google_storage_bucket" "storage-bucket" {
  provider      = google.impersonated
  name          = var.gcs_bucket_name
  location      = var.location
  force_destroy = true


  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}

resource "google_bigquery_dataset" "ny-taxi-demo-dataset" {
  provider   = google.impersonated
  dataset_id = var.bq_dataset_name
  location   = var.location
}

# provider "google" {
#   credentials = file(var.credentials)
#   project     = var.project
#   region      = var.region
# }