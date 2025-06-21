output "bastion" {
  value = google_compute_instance.bastion
}
output "back_group" {
  value = google_compute_instance_group_manager.back_group
}
output "front_group" {
  value = google_compute_instance_group_manager.front_group
}
