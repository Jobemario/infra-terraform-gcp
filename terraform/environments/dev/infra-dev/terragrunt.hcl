include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../modules/"
}

inputs = {
  environment             = "dev"
  project_id              = "ambiente-de-teste-project"
  project_name            = "Ambiente de teste Project"
  connector_machine_type  = "e2-medium"
  connector_max_instances = "3"
  region                  = "us-central1"
  zone                    = "us-central1-a"
  instance_id             = "vm-dev"
  vpc_id                  = "vpc-dev"
  subnet_id               = "subnet-dev"
  vpc_cidr                = "10.0.0.0/16"
  subnet_cidr             = "10.0.1.0/24"
  machine_type            = "e2-medium"
  boot_image              = "debian-cloud/debian-11"
}
