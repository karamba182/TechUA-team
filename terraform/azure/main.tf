  resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = "yura-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
   resource_group_name = azurerm_resource_group.main.name
  depends_on = [azurerm_resource_group.main]
}

resource "azurerm_subnet" "subnet" {
  name                 = "default-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]

}

resource "azurerm_network_security_group" "nsg" {
  name                = "yura-nsg"
  location            = var.location
   resource_group_name = azurerm_resource_group.main.name
  depends_on = [azurerm_resource_group.main]

  security_rule {
    name                       = "AllowSSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "AllowHTTP"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    destination_port_range     = "3000"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    source_port_range          = "*"
  }

  security_rule {
    name                       = "AllowBackend"
    priority                   = 1003
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    destination_port_range     = "5000"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    source_port_range          = "*"
  }
}
resource "azurerm_public_ip" "frontend_ip" {
  name                = "frontend-public-ip"
  location            = var.location
   resource_group_name = azurerm_resource_group.main.name
  allocation_method   = "Static"
  sku                 = "Basic"
  domain_name_label = "${var.project_name}-frontend"
  depends_on = [azurerm_resource_group.main]
}

resource "azurerm_public_ip" "backend_ip" {
  name                = "backend-public-ip"
  location            = var.location
   resource_group_name = azurerm_resource_group.main.name
  allocation_method   = "Static"
  sku                 = "Basic"
  domain_name_label   = "${var.project_name}-backend"
  depends_on = [azurerm_resource_group.main]

}

resource "azurerm_network_interface" "frontend_nic" {
  name                = "frontend-nic"
  location            = var.location
   resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "frontend-ipcfg"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.frontend_ip.id
  }
  depends_on = [azurerm_subnet.subnet]
  
}

resource "azurerm_network_interface" "backend_nic" {
  name                = "backend-nic"
  location            = var.location
   resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "backend-ipcfg"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.backend_ip.id
  }

 depends_on = [azurerm_subnet.subnet]
}

resource "azurerm_linux_virtual_machine" "frontend_vm" {
  name                = var.frontend_name
   resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.admin_username

  network_interface_ids = [azurerm_network_interface.frontend_nic.id]

  admin_ssh_key {
    username   = var.admin_username
    public_key = data.hcp_vault_secrets_secret.ssh_public_key.secret_value
  }

  disable_password_authentication = true

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}

resource "azurerm_linux_virtual_machine" "backend_vm" {
  name                = var.backend_name
   resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.admin_username
  network_interface_ids = [azurerm_network_interface.backend_nic.id]

  admin_ssh_key {
    username   = var.admin_username
    public_key = data.hcp_vault_secrets_secret.ssh_public_key.secret_value
  }

  disable_password_authentication = true

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "main" {
  name                        = var.key_vault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"
  purge_protection_enabled    = false
  depends_on = [azurerm_resource_group.main]
}

resource "azurerm_key_vault_access_policy" "current_user" {
  key_vault_id = azurerm_key_vault.main.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  secret_permissions = [
    "Get", "Set", "List"
  ]
}

resource "azurerm_key_vault_secret" "ssh_key" {
  name         = "ssh-public-key"
  value = data.hcp_vault_secrets_secret.ssh_public_key.secret_value
  key_vault_id = azurerm_key_vault.main.id

  depends_on = [azurerm_key_vault_access_policy.current_user]
}

resource "azurerm_key_vault_secret" "db_pass" {
  name         = "db-password"
  value        = var.db_password
  key_vault_id = azurerm_key_vault.main.id

  depends_on = [azurerm_key_vault_access_policy.current_user]
}

resource "azurerm_postgresql_flexible_server" "main" {
  name                    = var.postgres_server_name
  resource_group_name     = azurerm_resource_group.main.name
  location                = var.location
  administrator_login     = var.postgres_admin_user
  administrator_password  = data.hcp_vault_secrets_secret.postgres_admin_password.secret_value
  sku_name                = "B_Standard_B1ms"
  storage_mb              = 32768
  version                 = "15"
  zone                    = "1"
  depends_on = [azurerm_resource_group.main]
}


resource "azurerm_postgresql_flexible_server_database" "main" {
  name      = var.postgres_db_name
  server_id = azurerm_postgresql_flexible_server.main.id
  charset   = "UTF8"
  collation = "en_US.utf8"
}

resource "azurerm_postgresql_flexible_server_firewall_rule" "allow_azure" {
  name      = "AllowAzure"
  server_id = azurerm_postgresql_flexible_server.main.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}
