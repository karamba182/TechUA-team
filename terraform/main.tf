terraform {
  backend "gcs" {
    bucket = "teachua-tfstate"
    prefix = "terraform/state"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.8.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
    }
  }
}

provider "google" {
  project = var.project_name
  region  = var.google_region_name
  zone    = var.google_zone_name
}

module "network" {
  source = "./modules/network/gcp"
}

module "instances" {
  source          = "./modules/instances/gcp"
  compute_network = module.network.compute_network
}

module "database" {
  source     = "./modules/database/gcp"
  region     = var.google_region_name
  backend_ip = module.instances.back_external_ip
}

module "firewall" {
  source          = "./modules/firewall/gcp"
  compute_network = module.network.compute_network
}

module "local_provision" {
  source           = "./modules/local_provision/gcp"
  bastion          = module.instances.bastion
  back             = module.instances.back
  front            = module.instances.front
  google_zone_name = var.google_zone_name
  project_name     = var.project_name
}

# Database outputs
output "database_connection" {
  value       = module.database.database_connection
  description = "Database connection details"
}

output "jdbc_connection_string" {
  value       = module.database.jdbc_connection_string
  description = "JDBC connection string"
} 