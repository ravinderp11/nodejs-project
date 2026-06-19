#!/bin/bash

set -e

echo "Move to Terraform folder"

cd Terraform

echo "Initialize Terraform"

terraform init

echo "Validate"

terraform validate

echo "Deploy"

terraform apply -auto-approve