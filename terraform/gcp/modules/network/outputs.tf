output "compute_network" {
  value = google_compute_network.vpc_network
}

output "back_subnetwork" {
  value = google_compute_subnetwork.back
}

output "front_subnetwork" {
  value = google_compute_subnetwork.front
}

output "global_address" {
  value = google_compute_global_address.proxy
}
