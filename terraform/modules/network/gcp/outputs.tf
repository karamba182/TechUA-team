output "compute_network" {
  value = google_compute_network.vpc_network
}

output "global_address" {
  value = google_compute_global_address.default
}
