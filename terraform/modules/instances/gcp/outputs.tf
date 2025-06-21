output "bastion" {
  value = google_compute_instance.bastion
}
output "back" {
  value = google_compute_instance.back
}
output "front" {
  value = google_compute_instance.front
}
output "back_external_ip" {
  value       = google_compute_instance.back.network_interface[0].network_ip
  description = "Internal IP of backend instance"
}
