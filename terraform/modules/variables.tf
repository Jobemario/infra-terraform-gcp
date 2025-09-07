variable "project_id" {
  default = "ambiente-de-teste-project"
}
variable "project_name" {
  default = "ambiente-de-teste-project"
}
variable "billing_account" {
  default = "ambiente-de-teste-project"
}
variable "region" {
  default = "us-central1"
}
variable "zone" {
  default = "us-central1-a"
}
variable "instance_id" {
  default = "vm-dev"
}
variable "vpc_id" {
  default = "vpc-dev"
}
variable "subnet_id" {
  default = "subnet-dev"
}
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
variable "subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "machine_type" {
  default = "e2-medium"
}
variable "boot_image" {
  default = "debian-cloud/debian-11"
}

variable "ssh_keys" {
  default = ""
}
variable "service_account_email" {
  default = ""
}

variable "tags" {
  default = []
}
variable "ambiente_de_teste_project" {
  description = "The GCP project ID for the test environment"
  type        = string
}
