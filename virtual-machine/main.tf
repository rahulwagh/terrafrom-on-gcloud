provider "google" {
  credentials = file("/Users/rahulwagh/.gcp/credentials.json")
  project     = var.project_id
  region  = "europe-west4"
  zone    = "europe-west4-a"
}

resource "google_compute_instance" "terraform-managed-e2-small" {
  name         = "terraform"
  machine_type = "e2-small"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}