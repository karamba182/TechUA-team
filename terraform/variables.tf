variable "project_name" {
  description = "GCP project ID"
  type        = string
}

variable "google_region_name" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "google_zone_name" {
  description = "GCP zone"
  type        = string
  default     = "us-central1-c"
} 