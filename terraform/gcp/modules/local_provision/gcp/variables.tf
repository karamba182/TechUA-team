variable "bastion" {}
variable "back" {}
variable "front" {}

variable "populate_ssh_keys_cmd" {
  default = "./scripts/place_ssh_keys.sh"
}
variable "setup_ssh_gateway_cmd" {
  default = "./scripts/setup_ssh_gateway.sh"
}
variable "google_zone_name" {}
