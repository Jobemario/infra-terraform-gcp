# Infra-Terraform-GCP

Infraestrutura GCP gerenciado com Terraform

#Introduction

This project contains Google Cloud Platform infrastructure defined through Terragrunt.

#Prerequisites

. Google SDK and Google Authentication
. Management Terraform with Terragrunt

#How to Authenticate Google Cloud:

After the Google SDK is installed, keep authenticating with Google Cloud to use your resources using the gcloud command:

gcloud auth application-default login

#Installing Terraform:
Terraform Install

#Installing Terragrunt:
Terragrunt Install

#How to use :
Clone this repository on your local machine Change the directory to the project folder:

cd <your-local-folder>
Make the necessary changes to the configuration files to suit your needs. (No needed terragrunt init command to init terragrunt)

To format the terragrunt hcl correctly:

terragrunt hclfmt
To format the terraform code correctly:

terragrunt fmt
To verify the syntax:

terragrunt validate
View planned changes if you have gcp permissions:

terragrunt plan
Remembering that the pipeline flow to apply terragrunt is done only via github actions, don't apply terragrunt locally.

#References:
Google Cloud SDK

Google Cloud Authenticate

Terraform Google Provider

Terragrunt Start

Terragrunt Documents
