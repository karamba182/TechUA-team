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