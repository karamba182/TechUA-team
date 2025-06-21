variable "compute_network" {}
variable "backend_subnetwork" {}
variable "google_zone_name" {}

variable "bastion_name" {
  default = "bastion"
}
variable "back_name" {
  default = "back"
}
variable "front_name" {
  default = "front"
}

variable "bastion_machine_type" {
  default = "f1-micro"
}
variable "back_machine_type" {
  default = "f1-micro"
}
variable "front_machine_type" {
  default = "f1-micro"
}

variable "bastion_init_image" {
  default = "debian-cloud/debian-11"
}
variable "back_init_image" {
  default = "debian-cloud/debian-11"
}
variable "front_init_image" {
  default = "debian-cloud/debian-11"
}
