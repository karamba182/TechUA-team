output "vnet_id" {
  value = azurerm_virtual_network.this.id
}
output "subnet_ids" {
  value = { for s, r in azurerm_subnet.this : s => r.id }
}
