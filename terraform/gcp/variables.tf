variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "GCP zone"
  type        = string
  default     = "us-central1-c"
}

variable "db_tier" {
  description = "Cloud SQL instance tier"
  type        = string
  default     = "db-f1-micro"
}

variable "db_disk_size" {
  description = "Cloud SQL disk size in GB"
  type        = number
  default     = 10
}

variable "db_disk_type" {
  description = "Cloud SQL disk type (PD_SSD or PD_HDD)"
  type        = string
  default     = "PD_HDD"
}

variable "db_name" {
  description = "Database name"
  type        = string
  default     = "teachua"
}

variable "db_user" {
  description = "Database user"
  type        = string
  default     = "teachua_user"
} 