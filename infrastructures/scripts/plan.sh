#!/bin/bash

# plan.sh
# Usage: ./plan.sh <environment>

set -e

ENVIRONMENT=$1

if [ -z "$ENVIRONMENT" ]; then
  echo "Usage: $0 <environment>"
  exit 1
fi

cd ../environments/$ENVIRONMENT

echo "Initializing Terraform..."
terraform init

echo "Generating Terraform plan..."
terraform plan -out=tfplan

echo "Terraform plan saved to tfplan."

