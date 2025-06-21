output "global_address" {
  value = module.gcp_network[0].global_address.address
}

output "bastion_ip" {
  value = module.gcp_instances[0].bastion.network_interface.0.access_config[0].nat_ip
}
