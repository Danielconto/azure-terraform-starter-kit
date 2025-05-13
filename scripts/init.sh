#!/bin/bash

# This script initializes the Terraform environment for the Azure Terraform Starter Kit.

# Navigate to the environments directory
cd environments/dev

# Initialize Terraform
terraform init

# Validate the configuration
terraform validate

# Plan the deployment
terraform plan

# Apply the configuration
terraform apply -auto-approve

echo "Terraform environment initialized and applied successfully."