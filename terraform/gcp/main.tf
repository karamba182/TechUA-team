terraform {
  backend "gcs" {
    bucket = "teachua-tfstate"
    prefix = "terraform/state"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.8.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

resource "google_compute_instance" "bastion" {
  name         = "bastion"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }
}

resource "google_compute_firewall" "default" {
  name    = "main-firewall"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["22", "3001", "3002"]
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_instance" "back" {
  name         = "back"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }
}

resource "google_compute_instance" "front" {
  name         = "front"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    #access_config {
    #}
  }
}

resource "null_resource" "populate_ssh_keys" {
  depends_on = [
    google_compute_instance.bastion,
    google_compute_instance.back,
    google_compute_instance.front
  ]
  provisioner "local-exec" {
    command = "./scripts/place_ssh_keys.sh"
  }
  provisioner "local-exec" {
    command = "./scripts/setup_ssh_gateway.sh"
  }
}
