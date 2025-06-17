terraform {
  required_providers {
    hcp = {
      source  = "hashicorp/hcp"
      version = ">= 0.70.0"
    }
  }
}

provider "hcp" {
  # Использует текущий hcp auth login + profile
}

data "hcp_vault_secrets_secret" "ssh_public_key" {
  app_name    = "sample-app"
  secret_name = "ssh_public_key"
}

data "hcp_vault_secrets_secret" "db_password" {
  app_name    = "sample-app"
  secret_name = "db_password"
}

data "hcp_vault_secrets_secret" "postgres_admin_password" {
  app_name    = "sample-app"
  secret_name = "postgres_admin_password"
}

data "hcp_vault_secrets_secret" "postgres_server_name" {
  app_name    = "sample-app"
  secret_name = "postgres_server_name"
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
