variable "location" { default = "westeurope" }
variable "resource_group_name" {}
variable "admin_username" {}
variable "vm_size" { default = "Standard_B2s" }
variable "frontend_name" {}
variable "backend_name" {}
variable "key_vault_name" {
  default = "yura-keyvault"
}
variable "db_password" {
  default = "SuperSecure123!"
}
variable "project_name" {
  description = "Project name for DNS labels"
  type        = string
}
variable "postgres_server_name" {}
variable "postgres_admin_user" {}
variable "postgres_db_name" {}

variable "frontend_vm_size" {
  description = "VM size for the frontend virtual machine"
  default     = "Standard_B2s"
}

variable "backend_vm_size" {
  description = "VM size for the backend virtual machine"
  default     = "Standard_B1s"
}