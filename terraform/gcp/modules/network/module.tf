resource "google_compute_network" "vpc_network" {
  name = var.network_name
}

resource "google_compute_subnetwork" "back" {
  name          = var.back_subnetwork_name
  ip_cidr_range = var.back_ip_range
  region        = var.google_region_name
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "front" {
  name          = var.front_subnetwork_name
  ip_cidr_range = var.front_ip_range
  region        = var.google_region_name
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_global_address" "proxy" {
  name       = "proxy-access"
  ip_version = "IPV4"
}
