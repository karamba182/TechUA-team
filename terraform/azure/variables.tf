variable "location" {
  description = "Location Azure"
  default     = "westeurope"
}
variable "resource_group_name" {
  description = "Name of resource group"
}
variable "admin_username" {
  description = "Logan for admin in VM"
}
variable "vm_size" {
  description = "Tyoe of VM"
  default     = "Standard_B1s"
}
variable "ssh_public_key" {
  description = "Public ssh for vm"
}
variable "frontend_name" {
  description = "Name of frontend VM"
}
variable "backend_name" {
  description = "Name of backend VM"
}
variable "key_vault_name" {
  description = "Name Azure Key Vault"
  default     = "yura-keyvault"
}
variable "db_password" {
  description = "Password for db"
}
variable "postgres_server_name" {
  description = "Name of PostgreSQL Server"
}
variable "postgres_admin_user" {
  description = "Name of admin PostgreSQL"
}
variable "postgres_admin_password" {
  description = "Password for admin PostgreSQL"
}
variable "postgres_db_name" {
  description = "Name of db PostgreSQL"
}
variable "vnet_name" { 
  type = string 
  default = "yura-vnet" 
}
variable "address_space" { 
  type = list(string)
  default = ["10.0.0.0/16"] 
}

variable "subnets" {
  type = list(object({ 
    name = string 
    address_prefix = string 
  }))
  default = [
    { 
      name = "default" 
      address_prefix = "10.0.1.0/24" 
    }
  ]
}

variable "nsg_name" {
  type    = string
  default = "yura-nsg"
}
variable "security_rules" {
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_address_prefix      = string
    source_port_range          = string
    destination_address_prefix = string
    destination_port_range     = string
  }))
  default = [
    {
      name                       = "AllowSSH"
      priority                   = 1001
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_address_prefix      = "*"
      source_port_range          = "*"
      destination_address_prefix = "*"
      destination_port_range     = "22"
    },
    {
      name                       = "AllowHTTP"
      priority                   = 1002
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      destination_port_range     = "3000"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
      source_port_range          = "*"
    },
    {
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
  ]
}