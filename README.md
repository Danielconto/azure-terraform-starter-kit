# Azure Terraform Starter Kit

This project is a starter kit for deploying Azure resources using Terraform. It is structured to support multiple environments and includes a modular approach for resource management.

## Project Structure

- **modules/**: Contains reusable Terraform modules.
  - **example-module/**: An example module demonstrating how to define resources.
  
- **environments/**: Contains environment-specific configurations.
  - **dev/**: Development environment configurations.
  - **staging/**: Staging environment configurations.
  - **prod/**: Production environment configurations.
- **scripts/**: Contains scripts for initializing and managing the Terraform environment.

- **.gitignore**: Specifies files and directories to be ignored by Git.

- **README.md**: Documentation for the project.

- **terraform.tfvars**: Variable values for Terraform configurations.

## Getting Started

1. **Clone the repository**:
   ```
   git clone <repository-url>
   cd azure-terraform-starter-kit
   ```

2. **Initialize Terraform**:
   ```
   terraform init
   ```

3. **Select the environment**:
   Navigate to the desired environment directory (e.g., `environments/dev`).

4. **Plan the deployment**:
   ```
   terraform plan
   ```

5. **Apply the configuration**:
   ```
   terraform apply
   ```

## Backend Configuration

Example `backend.tf` for Azure Storage:

```hcl
terraform {
  backend "azurerm" {
    resource_group_name  = "example-rg"
    storage_account_name = "examplestorage"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
```

## Pre-Commit Hooks

Install pre-commit hooks to enforce Terraform best practices:

Example `.pre-commit-config.yaml`:
```yaml
repos:
  - repo: https://github.com/antonbabenko/pre-commit-terraform
    rev: v1.77.0
    hooks:
      - id: terraform_fmt
      - id: terraform_validate
```

## Modules

The `modules` directory contains reusable modules that can be utilized across different environments. Each module has its own README file for detailed usage instructions.

## Security Best Practices

- Use Azure Key Vault to store sensitive information.
- Avoid committing sensitive data (e.g., secrets) to version control.
- Use [terraform.tfvars](http://_vscodecontentref_/2) for environment-specific variables and add it to `.gitignore`.

## Troubleshooting

- **Error**: `Error acquiring the state lock`
  - **Solution**: Run `terraform force-unlock <LOCK_ID>` to release the lock.

## CI/CD Integration

Automate Terraform deployments using GitHub Actions. Example workflow:

```yaml
name: Terraform

on:
  push:
    branches:
      - main

jobs:
  terraform:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v3

      - name: Setup Terraform
        uses: hashicorp/setup-terraform@v2
        with:
          terraform_version: 1.5.0

      - name: Terraform Init
        run: terraform init

      - name: Terraform Plan
        run: terraform plan
```

## Testing

Before applying changes, validate the configuration:
```

## Contributing

Contributions are welcome! Please submit a pull request or open an issue for any enhancements or bug fixes.

## License

This project is licensed under the MIT License. See the LICENSE file for details.