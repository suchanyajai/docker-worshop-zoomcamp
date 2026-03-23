variable "credentials" {
  description = "My Credentials"
  default     = "/workspaces/docker-worshop-zoomcamp/keys/my-creds.json"
}

variable "zone" {
  description = "zone"
  default     = "us-central1-a"
}

variable "project" {
  description = "Project"
  default     = "ny-rides-suchanya"
}

variable "region" {
  description = "Region"
  default     = "us-central1"
}

variable "location" {
  description = "Project Location"
  default     = "US"
}

variable "bq_dataset_name" {
  description = "My BigQuery Dataset Name"
  default     = "ny_taxi_demo_dataset"
}

variable "gcs_bucket_name" {
  description = "My Storage Bucket Name"
  default     = "ny-rides-suchanya-terra-bucket"
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"
}