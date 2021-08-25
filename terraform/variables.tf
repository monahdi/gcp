variable "project" {
  description = "Project ID"
}

variable "region" {
  description = "Region"

  # Значение по умолчанию
  default = "europe-north1"
}

variable "disk_image" {
  description = "Disk image"
}

variable "zone" {
  description = "Zone"

  #Значение по умолчанию
  default = "europe-north1-a"
}

variable "app_disk_image" {
  description = "Disk image for reddit app"
  default     = "reddit-app-1629901170"
}

variable "db_disk_image" {
  description = "Disk image for reddit db"
  default     = "reddit-db-1629901373"
}
