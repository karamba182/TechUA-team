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

# GCP
module "gcp_network" {
  source             = "./modules/network/gcp"
  count              = var.cloud_platform == "gcp" ? 1 : 0
  google_region_name = var.google_region_name
}

module "gcp_instances" {
  source           = "./modules/instances/gcp"
  count            = var.cloud_platform == "gcp" ? 1 : 0
  compute_network  = module.gcp_network[0].compute_network
  google_zone_name = var.google_zone_name
}

#module "gcp_database" {
#count = var.cloud_platform == "gcp" ? 1 : 0
#source = "./modules/database/gcp"
#}

module "gcp_proxy" {
  source         = "./modules/proxy/gcp"
  count          = var.cloud_platform == "gcp" ? 1 : 0
  back_group     = module.gcp_instances[0].back_group
  global_address = module.gcp_network[0].global_address
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
  back             = module.gcp_instances[0].back
  front            = module.gcp_instances[0].front
  google_zone_name = var.google_zone_name
}

# AWS
module "aws_network" {
  source = "./modules/network/aws"
  count  = var.cloud_platform == "aws" ? 1 : 0
}

module "aws_instances" {
  source = "./modules/instances/aws"
  count  = var.cloud_platform == "aws" ? 1 : 0
}

#module "aws_database" {
#count = var.cloud_platform == "aws" ? 1 : 0
#source = "./modules/database/aws"
#}

module "aws_proxy" {
  source = "./modules/proxy/aws"
  count  = var.cloud_platform == "aws" ? 1 : 0
}

module "aws_firewall" {
  source = "./modules/firewall/aws"
  count  = var.cloud_platform == "aws" ? 1 : 0
}

module "aws_local_provision" {
  source = "./modules/local_provision/aws"
  count  = var.cloud_platform == "aws" ? 1 : 0
}

# AZURE
module "azure_network" {
  source = "./modules/network/azure"
  count  = var.cloud_platform == "azure" ? 1 : 0
}

module "azure_instances" {
  source = "./modules/instances/azure"
  count  = var.cloud_platform == "azure" ? 1 : 0
}

#module "azure_database" {
#count = var.cloud_platform == "azure" ? 1 : 0
#source = "./modules/database/azure"
#}

module "azure_proxy" {
  source = "./modules/proxy/azure"
  count  = var.cloud_platform == "azure" ? 1 : 0
}

module "azure_firewall" {
  source = "./modules/firewall/azure"
  count  = var.cloud_platform == "azure" ? 1 : 0
}

module "azure_local_provision" {
  source = "./modules/local_provision/azure"
  count  = var.cloud_platform == "azure" ? 1 : 0
}
