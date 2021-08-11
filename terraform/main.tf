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
  zone            = "${var.zone}"
}

module "db" {
  source          = "./modules/db"
  zone            = "${var.zone}"
}