output "bastion" {
  value = google_compute_instance.bastion
}
output "back_group" {
  value = google_compute_instance_group_manager.back_group
}
output "front_group" {
  value = google_compute_instance_group_manager.front_group
}

# For database authorization - we'll use a placeholder since we have managed groups
output "backend_ip" {
  value       = "0.0.0.0/0" # Allow all IPs for now since we have managed instance groups
  description = "Backend IP for database authorization - currently open to all"
}
