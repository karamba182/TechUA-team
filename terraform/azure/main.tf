
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

data "azurerm_client_config" "current" {}

module "network" {
  source              = "./modules/network"
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location

  vnet_name      = var.vnet_name
  address_space  = var.address_space
  subnets        = var.subnets     # список з об’єктами name/address_prefix
}

module "security" {
  source              = "./modules/security_rules"
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location

  nsg_name = var.nsg_name
  rules    = var.security_rules   # список об’єктів з правилами
}

module "vm" {
  source              = "./modules/vm"
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  admin_username      = var.admin_username
  ssh_public_key      = var.ssh_public_key
  vm_size             = var.vm_size

  vms = {
    frontend = {
      name      = var.frontend_name
      subnet_id = module.network.subnet_ids["default"]
      nsg_id    = module.security.nsg_id
      public_ip = true
    }
    backend = {
      name      = var.backend_name
      subnet_id = module.network.subnet_ids["default"]
      nsg_id    = module.security.nsg_id
      public_ip = true
    }
  }
}


module "keyvault" {
  source  = "./modules/keyvault"
  depends_on = [azurerm_resource_group.main]

  resource_group_name       = azurerm_resource_group.main.name
  location                  = var.location
  key_vault_name            = var.key_vault_name
  tenant_id                 = data.azurerm_client_config.current.tenant_id
  object_id                 = data.azurerm_client_config.current.object_id
  ssh_public_key_value      = var.ssh_public_key
  db_password_value         = var.db_password
  postgres_admin_user_value       = var.postgres_admin_user
  postgres_admin_password_value  = var.postgres_admin_password
  postgres_db_name_value          = var.postgres_db_name
}

module "postgres" {
  source  = "./modules/postgres"
  depends_on = [azurerm_resource_group.main]

  resource_group_name    = azurerm_resource_group.main.name
  location               = var.location
  postgres_server_name   = var.postgres_server_name
  postgres_admin_user    = var.postgres_admin_user
  postgres_admin_password= var.postgres_admin_password
  postgres_db_name       = var.postgres_db_name
}
