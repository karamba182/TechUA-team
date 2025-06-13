variable "location" { default = "westeurope" }
variable "resource_group_name" {}
variable "admin_username" {}
variable "vm_size" { default = "Standard_B1s" }
variable "ssh_public_key" {}
variable "frontend_name" {}
variable "backend_name" {}
variable "key_vault_name" {
  default = "yura-keyvault"
}
variable "db_password" {
  default = "SuperSecure123!"  # або передай через tfvars
}
variable "postgres_server_name" {}
variable "postgres_admin_user" {}
variable "postgres_admin_password" {}
variable "postgres_db_name" {}
