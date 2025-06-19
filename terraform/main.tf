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

#module "database" {
#source = "./modules/database/gcp"
#}

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
}
