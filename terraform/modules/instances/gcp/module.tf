resource "google_compute_instance_template" "back_temp" {
  name = "back-temp"
  disk {
    auto_delete  = true
    boot         = true
    device_name  = "persistent-disk-0"
    mode         = "READ_WRITE"
    source_image = "projects/debian-cloud/global/images/family/debian-11"
    type         = "PERSISTENT"
  }
  labels = {
    managed-by-cnrm = "true"
    group_instance = "back-group"
  }
  machine_type = var.machine_type
  metadata = {
    startup-script = "#! /bin/bash\n     sudo apt-get update\n     sudo apt-get install apache2 -y\n     sudo a2ensite default-ssl\n     sudo a2enmod ssl\n     vm_hostname=\"$(curl -H \"Metadata-Flavor:Google\" \\\n   http://169.254.169.254/computeMetadata/v1/instance/name)\"\n   sudo echo \"Page served from: $vm_hostname\" | \\\n   tee /var/www/html/index.html\n   sudo systemctl restart apache2"
  }
  network_interface {
    access_config {
      network_tier = "PREMIUM"
    }
    network    = "global/networks/terraform-network"
    subnetwork = "regions/us-central1/subnetworks/backend-subnet"
  }
  region = "us-central1"
  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    provisioning_model  = "STANDARD"
  }
  service_account {
    email  = "default"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/pubsub", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }
  tags = ["allow-health-check"]
}

resource "google_compute_instance_group_manager" "back_group" {
  name = "back-group"
  zone = var.google_zone_name
  named_port {
    name = "http"
    port = 80
  }
  version {
    instance_template = google_compute_instance_template.back_temp.id
    name              = "primary"
  }
  base_instance_name = "back"
  target_size        = 1
}

#################### TODO: remove
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
