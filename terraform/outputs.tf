# Database outputs
output "database_connection" {
  value       = module.gcp_database[0].database_connection
  description = "Database connection details"
}

output "jdbc_connection_string" {
  value       = module.gcp_database[0].jdbc_connection_string
  description = "JDBC connection string"
}
