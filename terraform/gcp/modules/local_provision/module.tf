resource "null_resource" "config_ssh" {
  depends_on = [
    var.bastion,
  ]
  provisioner "local-exec" {
    command = var.compute_config_ssh_cmd
  }
}
