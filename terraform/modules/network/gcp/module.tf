resource "google_compute_network" "vpc_network" {
  name = var.network_name
}

resource "google_compute_subnetwork" "backend" {
  name          = var.backend_subnetwork_name
  ip_cidr_range = var.backend_ip_range
  region        = var.google_region_name
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_global_address" "back" {
  name       = "proxy-access-back"
  ip_version = "IPV4"
}

resource "google_compute_global_address" "front" {
  name       = "proxy-access-front"
  ip_version = "IPV4"
}
