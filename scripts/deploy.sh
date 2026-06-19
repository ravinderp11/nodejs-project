#!/bin/bash

set -e

cd Terraform

echo "Terraform Init"
terraform init

echo "Terraform Validate"
terraform validate

echo "Terraform Apply"

terraform apply -auto-approve \
-var="subnet1=subnet-06d82a3e886c42930" \
-var="subnet2=subnet-0f7431ee89ac2b19b" \
-var="sg=sg-016b8014c069d78f5"