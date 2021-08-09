terraform {
  # Версия terraform
  required_version = "1.0.4"
}
provider "google" {
  project = var.project
  region  = var.region
}

module "app" {
  source          = "./modules/app"
  app_disk_image  = "${var.app_disk_image}"
  zone            = "${var.zone}"
}

module "db" {
  source          = "./modules/db"
  db_disk_image   = "${var.db_disk_image}"
  zone            = "${var.zone}"
}