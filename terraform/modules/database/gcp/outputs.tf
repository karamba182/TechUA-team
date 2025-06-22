output "database_connection" {
  value = {
    host     = google_sql_database_instance.teachua_db.public_ip_address
    port     = 5432
    database = google_sql_database.teachua.name
    username = google_sql_user.teachua_user.name
    secret   = google_secret_manager_secret.db_connection_string.id
  }
  description = "Database connection details"
}

output "jdbc_connection_string" {
  value       = "jdbc:postgresql://${google_sql_database_instance.teachua_db.public_ip_address}:5432/${google_sql_database.teachua.name}"
  description = "JDBC connection string"
}

# Database configuration for setenv
output "setenv_database_config" {
  value = <<-EOF
# Database configuration from Terraform
# Updated: ${timestamp()}
export DEV2_DATASOURCE_URL="jdbc:postgresql://${google_sql_database_instance.teachua_db.public_ip_address}:5432/${google_sql_database.teachua.name}"
export DEV2_DATASOURCE_USER="${google_sql_user.teachua_user.name}"
export DEV2_DATASOURCE_PASSWORD="${var.db_password}"

export PROD_DATASOURCE_URL="jdbc:postgresql://${google_sql_database_instance.teachua_db.public_ip_address}:5432/${google_sql_database.teachua.name}"
export PROD_DATASOURCE_USER="${google_sql_user.teachua_user.name}"
export PROD_DATASOURCE_PASSWORD="${var.db_password}"
EOF
  description = "Database configuration for setenv.sh"
  sensitive   = true
}

output "database_ip" {
  value       = google_sql_database_instance.teachua_db.public_ip_address
  description = "Public IP address of the database"
} 