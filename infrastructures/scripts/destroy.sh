#!/bin/bash

# destroy.sh
# Usage: ./destroy.sh <environment>

set -e

ENVIRONMENT=$1

if [ -z "$ENVIRONMENT" ]; then
  echo "Usage: $0 <environment>"
  exit 1
fi

cd ../environments/$ENVIRONMENT

echo "Initializing Terraform..."
terraform init

echo "Destroying Terraform-managed infrastructure..."
terraform destroy -auto-approve

echo "Terraform destroy completed."
