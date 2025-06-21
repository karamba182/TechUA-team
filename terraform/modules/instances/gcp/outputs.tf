output "bastion" {
  value = google_compute_instance.bastion
}
output "back" {
  value = google_compute_instance.back
}
output "front" {
  value = google_compute_instance.front
}
output "back_group" {
  value = google_compute_instance_group_manager.back_group
}
output "back_external_ip" {
  value       = google_compute_instance.back.network_interface.0.network_ip
  description = "External IP of backend instance"
}
