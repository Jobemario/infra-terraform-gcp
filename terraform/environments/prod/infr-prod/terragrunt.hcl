include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules"
}

inputs = {
  environment             = "prod"
  project_id              = "ambiente-de-teste-project"
  project_name            = "Ambiente de teste Project"
  connector_machine_type  = "e2-medium"
  connector_max_instances = "3"
  region                  = "us-central1"
  zone                    = "us-central1-a"
  instance_id             = "vm-prod"
  vpc_id                  = "vpc-prod"
  subnet_id               = "subnet-prod"
  vpc_cidr                = "11.0.0.0/16"
  subnet_cidr             = "11.0.1.0/24"
  machine_type            = "e2-medium"
  boot_image              = "debian-cloud/debian-11"
}

locals {
  common_tags = {
    owner       = "SeuNome"
    environment = "prod"
  }
}

# This file is managed by Terraform. Changes may be overwritten.

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.5"
    }
  }

  required_version = ">= 0.12"
}

provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_compute_instance" "default" {
  count        = var.connector_max_instances
  name         = "${var.instance_id}-${count.index}"
  machine_type = var.connector_machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.boot_image
    }
  }

  network_interface {
    network    = var.vpc_id
    subnetwork = var.subnet_id
  }

  metadata = {
    environment = var.environment
  }

  tags = flatten([
    for key, value in local.common_tags : [
      "${key}-${value}",
    ]
  ])
}

output "instance_ips" {
  value = google_compute_instance.default.*.network_interface[0].access_config[0].nat_ip
}
