data "google_client_openid_userinfo" "me" {
}

resource "google_os_login_ssh_public_key" "default" {
  project = var.project_name
  user    = data.google_client_openid_userinfo.me.email
  key     = file("~/.ssh/google_compute_engine.pub")
}
