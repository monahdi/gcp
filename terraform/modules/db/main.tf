
resource "google_compute_address" "db_ip" {
  name = "reddit-db-ip"
}

resource "google_compute_instance" "db" {
  name         = "reddit-db"
  machine_type = "e2-small"
  zone         = var.zone
  tags         = ["reddit-db"]
  boot_disk {
    initialize_params {
      image = var.db_disk_image
    }
  }
  network_interface {
    network = "default"
    access_config {
      nat_ip = google_compute_address.db_ip.address
    }
  }
}
resource "google_compute_address" "internal" {
  name         = "internal-address"
  address_type = "INTERNAL"
  purpose      = "GCE_ENDPOINT"
}

# Правило firewall
resource "google_compute_firewall" "firewall_mongo" {
  name    = "allow-mongo-default"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["27017"]
  }
  target_tags = ["reddit-db"]
  source_tags = ["reddit-app"]
}