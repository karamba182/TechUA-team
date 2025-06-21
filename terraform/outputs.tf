output "global_address_back" {
  value = module.gcp_network[0].global_address_back.address
}

output "global_address_front" {
  value = module.gcp_network[0].global_address_front.address
}

output "bastion_ip" {
  value = module.gcp_instances[0].bastion.network_interface.0.access_config[0].nat_ip
}
