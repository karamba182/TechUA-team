variable "bastion" {}

variable "compute_config_ssh_cmd" {
  default = "gcloud compute config-ssh"
}
variable "google_zone_name" {}
