resource "azurerm_postgresql_flexible_server" "main" {
  name                   = var.postgres_server_name
  resource_group_name    = var.resource_group_name
  location               = var.location
  administrator_login    = var.postgres_admin_user
  administrator_password = var.postgres_admin_password

  sku_name   = var.postgres_sku_name
  storage_mb = var.postgres_storage_mb
  version    = var.postgres_version
  zone       = var.postgres_zone
  public_network_access_enabled = true
}

resource "azurerm_postgresql_flexible_server_firewall_rule" "allow_azure_services" {
  name             = "allow-azure-services"
  server_id        = azurerm_postgresql_flexible_server.main.id
  # саме ця пара адрес еквівалентна “Allow public access from any Azure service…”
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}

resource "azurerm_postgresql_flexible_server_firewall_rule" "allow_ansibble" {
  name             = "allow_ansible"
  server_id        = azurerm_postgresql_flexible_server.main.id
  start_ip_address = "46.150.72.166"
  end_ip_address   = "46.150.72.166"
}

resource "azurerm_postgresql_flexible_server_database" "main" {
  name      = var.postgres_db_name
  server_id = azurerm_postgresql_flexible_server.main.id
}