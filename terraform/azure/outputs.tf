output "frontend_public_ip" {
  value = azurerm_public_ip.frontend_ip.ip_address
}

output "backend_public_ip" {
  value = azurerm_public_ip.backend_ip.ip_address
}

output "frontend_private_ip" {
  value = azurerm_network_interface.frontend_nic.private_ip_address
}

output "backend_private_ip" {
  value = azurerm_network_interface.backend_nic.private_ip_address
}

output "key_vault_uri" {
  value = azurerm_key_vault.main.vault_uri
}

output "postgres_fqdn" {
  value = azurerm_postgresql_flexible_server.main.fqdn
}
output "frontend_fqdn" {
  value = azurerm_public_ip.frontend_ip.fqdn
}

output "backend_fqdn" {
  value = azurerm_public_ip.backend_ip.fqdn
}
output "ssh_public_key" {
  value     = data.hcp_vault_secrets_secret.ssh_public_key.secret_value
  sensitive = true
}

output "db_password" {
  value     = data.hcp_vault_secrets_secret.db_password.secret_value
  sensitive = true
}

output "postgres_admin_password" {
  value     = data.hcp_vault_secrets_secret.postgres_admin_password.secret_value
  sensitive = true
}

output "postgres_server_name" {
  value     = data.hcp_vault_secrets_secret.postgres_server_name.secret_value
  sensitive = true
}
output "frontend_dns_name" {
  description = "DNS name for the frontend public IP"
  value       = azurerm_public_ip.frontend_ip.fqdn
}

output "backend_dns_name" {
  description = "DNS name for the backend public IP"
  value       = azurerm_public_ip.backend_ip.fqdn
}

