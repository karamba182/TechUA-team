variable "compute_network" {}

variable "firewall_name" {
  default = "main-firewall"
}
variable "first_protocol_to_allow" {
  default = "tcp"
}
variable "second_protocol_to_allow" {
  default = "icmp"
}
variable "allowed_tcp_ports" {
  default = ["22", "3001", "3002", "80", "8080", "443"]
}
variable "source_ranges" {
  default = ["0.0.0.0/0"]
}
