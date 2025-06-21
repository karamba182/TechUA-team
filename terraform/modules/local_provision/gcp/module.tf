resource "null_resource" "populate_ssh_keys" {
  depends_on = [
    var.bastion,
    var.back,
    var.front,
  ]
  provisioner "local-exec" {
    command = "${var.populate_ssh_keys_cmd} --zone=${var.google_zone_name} --project=${var.project_name}"
  }
  provisioner "local-exec" {
    command = "${var.setup_ssh_gateway_cmd} --zone=${var.google_zone_name} --project=${var.project_name}"
  }
}
