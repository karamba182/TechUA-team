variable "bucket_name" {
  default = "teachua-tfstate"
}

variable "project_name" {
  default = "teachua-6147"
}

variable "google_region_name" {
  default = "us-central1"
}

variable "google_zone_name" {
  default = "us-central1-c"
}

variable "cloud_platform" {
  default = "gcp"
}

# Database variables
variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}
