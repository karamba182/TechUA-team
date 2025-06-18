output "public_ips" {
  description = "Map of Public IPs for all VMs"
  value       = module.vm.public_ips
}

# Окремо Frontend Public IP
output "frontend_public_ip" {
  description = "Public IP of the frontend VM"
  value       = module.vm.public_ips["frontend"]
}

# Окремо Backend Public IP
output "backend_public_ip" {
  description = "Public IP of the backend VM"
  value       = module.vm.public_ips["backend"]
}

# Всі приватні IP як мапа
output "private_ips" {
  description = "Map of Private IPs for all VMs"
  value       = module.vm.private_ips
}

# Окремо Frontend Private IP
output "frontend_private_ip" {
  description = "Private IP of the frontend VM"
  value       = module.vm.private_ips["frontend"]
}

# Окремо Backend Private IP
output "backend_private_ip" {
  description = "Private IP of the backend VM"
  value       = module.vm.private_ips["backend"]
}