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

# GCP
module "gcp_meta" {
  source       = "./modules/meta/gcp"
  count        = var.cloud_platform == "gcp" ? 1 : 0
  project_name = var.project_name
}

module "gcp_network" {
  source             = "./modules/network/gcp"
  count              = var.cloud_platform == "gcp" ? 1 : 0
  google_region_name = var.google_region_name
}

module "gcp_instances" {
  source             = "./modules/instances/gcp"
  count              = var.cloud_platform == "gcp" ? 1 : 0
  compute_network    = module.gcp_network[0].compute_network
  backend_subnetwork = module.gcp_network[0].backend_subnetwork
  google_zone_name   = var.google_zone_name
}

module "gcp_database" {
  source      = "./modules/database/gcp"
  count       = var.cloud_platform == "gcp" ? 1 : 0
  region      = var.google_region_name
  backend_ip  = module.gcp_instances[0].backend_ip
  db_password = var.db_password
}

module "gcp_proxy" {
  source               = "./modules/proxy/gcp"
  count                = var.cloud_platform == "gcp" ? 1 : 0
  back_group           = module.gcp_instances[0].back_group
  front_group          = module.gcp_instances[0].front_group
  global_address_back  = module.gcp_network[0].global_address_back
  global_address_front = module.gcp_network[0].global_address_front
}

module "gcp_firewall" {
  source          = "./modules/firewall/gcp"
  count           = var.cloud_platform == "gcp" ? 1 : 0
  compute_network = module.gcp_network[0].compute_network
}

module "gcp_local_provision" {
  source           = "./modules/local_provision/gcp"
  count            = var.cloud_platform == "gcp" ? 1 : 0
  bastion          = module.gcp_instances[0].bastion
  google_zone_name = var.google_zone_name
}

# AWS and Azure modules commented out - only using GCP for now
# AWS
#module "aws_network" {
#  source = "./modules/network/aws"
#  count  = var.cloud_platform == "aws" ? 1 : 0
#}
#
#module "aws_instances" {
#  source = "./modules/instances/aws"
#  count  = var.cloud_platform == "aws" ? 1 : 0
#}
#
#module "aws_proxy" {
#  source = "./modules/proxy/aws"
#  count  = var.cloud_platform == "aws" ? 1 : 0
#}
#
#module "aws_firewall" {
#  source = "./modules/firewall/aws"
#  count  = var.cloud_platform == "aws" ? 1 : 0
#}
#
#module "aws_local_provision" {
#  source = "./modules/local_provision/aws"
#  count  = var.cloud_platform == "aws" ? 1 : 0
#}

# AZURE
#module "azure_network" {
#  source = "./modules/network/azure"
#  count  = var.cloud_platform == "azure" ? 1 : 0
#}
#
#module "azure_instances" {
#  source = "./modules/instances/azure"
#  count  = var.cloud_platform == "azure" ? 1 : 0
#}
#
#module "azure_proxy" {
#  source = "./modules/proxy/azure"
#  count  = var.cloud_platform == "azure" ? 1 : 0
#}
#
#module "azure_firewall" {
#  source = "./modules/firewall/azure"
#  count  = var.cloud_platform == "azure" ? 1 : 0
#}
#
#module "azure_local_provision" {
#  source = "./modules/local_provision/azure"
#  count  = var.cloud_platform == "azure" ? 1 : 0
#}
