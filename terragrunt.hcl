locals {
  backend_project = "infra-terraform-gcp"
}

remote_state {
  backend = "gcs"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket   = "infra-terraform-gcp"
    prefix   = "${path_relative_to_include()}/terraform.tfstate"
    project  = local.backend_project
    location = "us"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF

provider "google" {
  project = "${local.backend_project}"
}

terraform {
  required_version = ">= 1.7.2"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.24.0"
    }
  }

}

EOF
}
