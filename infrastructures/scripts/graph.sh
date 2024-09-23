#!/bin/bash

# graph.sh
# Usage: ./graph.sh <environment>

set -e

ENVIRONMENT=$1

if [ -z "$ENVIRONMENT" ]; then
  echo "Usage: $0 <environment>"
  exit 1
fi

cd ../environments/$ENVIRONMENT

echo "Initializing Terraform..."
terraform init

echo "Generating Terraform graph..."
terraform graph | dot -Tpng > graph.png

echo "Terraform graph saved to graph.png."
