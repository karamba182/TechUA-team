output "global_address_back" {
  value = module.gcp_network[0].global_address_back.address
}

output "global_address_front" {
  value = module.gcp_network[0].global_address_front.address
}

output "bastion_ip" {
  value = module.gcp_instances[0].bastion.network_interface.0.access_config[0].nat_ip
}

# Database outputs for GCP - commented until database module is enabled
#output "database_connection" {
#  value = var.cloud_platform == "gcp" ? (
#    length(module.gcp_database) > 0 ? module.gcp_database[0].database_connection : null
#  ) : null
#  description = "Database connection details"
#  sensitive   = true
#}
#
#output "jdbc_connection_string" {
#  value = var.cloud_platform == "gcp" ? (
#    length(module.gcp_database) > 0 ? module.gcp_database[0].jdbc_connection_string : null
#  ) : null
#  description = "JDBC connection string"
#}
