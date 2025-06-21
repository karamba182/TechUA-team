# Enable required APIs
resource "google_project_service" "sqladmin" {
  service            = "sqladmin.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "secretmanager" {
  service            = "secretmanager.googleapis.com"
  disable_on_destroy = false
}

# Generate secure password for database user
resource "random_password" "db_password" {
  length  = 16
  special = true
}

# PostgreSQL Instance
resource "google_sql_database_instance" "teachua_db" {
  name                = "${var.db_name}-postgres-instance"
  database_version    = "POSTGRES_15"
  region              = var.region
  deletion_protection = false

  depends_on = [google_project_service.sqladmin]

  settings {
    tier = var.db_tier

    disk_size       = var.db_disk_size # GB
    disk_type       = var.db_disk_type
    disk_autoresize = false

    backup_configuration {
      enabled                        = true
      start_time                     = "03:00"
      location                       = var.region
      point_in_time_recovery_enabled = false
    }

    ip_configuration {
      ipv4_enabled = true

      authorized_networks {
        name  = "backend-instance"
        value = google_compute_instance.back.network_interface[0].access_config[0].nat_ip
      }

      authorized_networks {
        name  = "allow-all"
        value = "0.0.0.0/0"
      }
    }

    database_flags {
      name  = "max_connections"
      value = "50"
    }
  }
}

# Create TeachUA database
resource "google_sql_database" "teachua" {
  name     = var.db_name
  instance = google_sql_database_instance.teachua_db.name
}

# Create database user
resource "google_sql_user" "teachua_user" {
  name     = var.db_user
  instance = google_sql_database_instance.teachua_db.name
  password = random_password.db_password.result
}

# Store database credentials in Secret Manager
resource "google_secret_manager_secret" "db_connection_string" {
  secret_id = "teachua-db-connection"

  depends_on = [google_project_service.secretmanager]

  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "db_connection_string" {
  secret = google_secret_manager_secret.db_connection_string.id

  secret_data = jsonencode({
    host     = google_sql_database_instance.teachua_db.public_ip_address
    port     = 5432
    database = google_sql_database.teachua.name
    username = google_sql_user.teachua_user.name
    password = random_password.db_password.result
    jdbc_url = "jdbc:postgresql://${google_sql_database_instance.teachua_db.public_ip_address}:5432/${google_sql_database.teachua.name}"
  })
}

# Database connection outputs
output "database_connection" {
  value = {
    host     = google_sql_database_instance.teachua_db.public_ip_address
    port     = 5432
    database = google_sql_database.teachua.name
    username = google_sql_user.teachua_user.name
    secret   = google_secret_manager_secret.db_connection_string.id
  }

  description = "Database connection details (password stored in Secret Manager)"
}

output "jdbc_connection_string" {
  value       = "jdbc:postgresql://${google_sql_database_instance.teachua_db.public_ip_address}:5432/${google_sql_database.teachua.name}"
  description = "JDBC connection string for the application"
} 