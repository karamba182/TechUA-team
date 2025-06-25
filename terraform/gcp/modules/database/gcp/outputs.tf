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

output "database_ip" {
  value       = google_sql_database_instance.teachua_db.public_ip_address
  description = "Public IP address of the database"
} 