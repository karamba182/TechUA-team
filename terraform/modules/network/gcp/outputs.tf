output "compute_network" {
  value = google_compute_network.vpc_network
}

output "backend_subnetwork" {
  value = google_compute_subnetwork.backend
}

output "global_address_back" {
  value = google_compute_global_address.back
}

output "global_address_front" {
  value = google_compute_global_address.front
}
