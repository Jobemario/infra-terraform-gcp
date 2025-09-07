output "project_id" {
  value = google.project_id_ambiente-de-teste-project
}
output "vpc_network" {
  value = google_compute_network.vpc_network.ambiente-de-teste-project
}
output "subnet_ambiente-de-teste-project" {
  value = google_compute_subnetwork.subnet.ambiente-de-teste-project
}
output "instance_ambiente-de-teste-project" {
  value = google_compute_instance.vm_instance.ambiente-de-teste-project
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
output "project_name" {
  value = var.project_name
}
output "vpc_cidr" {
  value = var.vpc_cidr
}
output "subnet_cidr" {
  value = var.subnet_cidr
}
output "machine_type" {
  value = var.machine_type
}
output "boot_image" {
  value = var.boot_image
}
output "ssh_keys" {
  value = var.ssh_keys
}
