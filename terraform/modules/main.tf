provider "google" {
  project     = var.ambiente_de_teste_project
  region      = var.region
}
resource "google_project" "project" {
  name            = var.project_id
  project_id      = var.project_id
  billing_account = var.billing_account
}
resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_id
  auto_create_subnetworks = false
}
resource "google_compute_subnetwork" "subnet" {
  name          = var.subnet_id
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet" {
  name          = var.subnet_id
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  network       = google_compute_network.vpc_network.id
}
resource "google_compute_instance" "vm_instance" {
  name         = var.instance_id
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.boot_image
    }
  }

  network_interface {
    network    = google_compute_network.vpc_network.id
    subnetwork = google_compute_subnetwork.subnet.id
    access_config {}
  }

  metadata = {
    ssh-keys = var.ssh_keys
  }

  service_account {
    email  = var.service_account_email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}
output "instance_ip" {
  value = google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip
}

output "project_id" {
  value = google_project.project.project_id
}

output "vpc_name" {
  value = google_compute_network.vpc_network.name
}

output "subnet_name" {
  value = google_compute_subnetwork.subnet.name
}

output "instance_name" {
  value = google_compute_instance.vm_instance.name
}

output "zone" {
  value = google_compute_instance.vm_instance.zone
}

output "region" {
  value = var.region
}

output "machine_type" {
  value = google_compute_instance.vm_instance.machine_type
}

output "boot_image" {
  value = var.boot_image
}

output "ssh_keys" {
  value = var.ssh_keys
}

output "service_account_email" {
  value = var.service_account_email
}

output "billing_account" {
  value = var.billing_account
}

output "vpc_cidr" {
  value = var.vpc_cidr
}

output "subnet_cidr" {
  value = var.subnet_cidr
}