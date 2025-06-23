variable "region" {
  description = "GCP region"
  type        = string
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
  description = "Cloud SQL disk type"
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

variable "deletion_protection" {
  description = "Enable deletion protection for database"
  type        = bool
  default     = false
}

variable "backend_ip" {
  description = "Backend instance IP for authorized networks"
  type        = string
}

variable "db_password" {
  description = "Static database password from environment"
  type        = string
  sensitive   = true
} 