resource "google_compute_instance" "bastion" {
  name         = var.bastion_name
  machine_type = var.bastion_machine_type

  boot_disk {
    initialize_params {
      image = var.bastion_init_image
    }
  }

  network_interface {
    network = var.compute_network.name
    access_config {
    }
  }
}

resource "google_compute_instance" "back" {
  name         = var.back_name
  machine_type = var.back_machine_type

  boot_disk {
    initialize_params {
      image = var.back_init_image
    }
  }

  network_interface {
    network = var.compute_network.name
    #access_config {
    #}
  }
}

resource "google_compute_instance" "front" {
  name         = var.front_name
  machine_type = var.front_machine_type

  boot_disk {
    initialize_params {
      image = var.front_init_image
    }
  }

  network_interface {
    network = var.compute_network.name
    #access_config {
    #}
  }
}
