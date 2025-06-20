variable "network_name" {
  default = "terraform-network"
}

variable "backend_subnetwork_name" {
  default = "backend-subnet"
}

variable "backend_ip_range" {
  default = "10.1.0.0/16"
}

variable "google_region_name" {}
