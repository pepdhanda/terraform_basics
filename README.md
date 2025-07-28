# Terraform Azure Blob Storage

This Terraform configuration creates Azure Blob Storage resources including:
- Resource Group
- Storage Account with unique naming
- Multiple Blob Storage Containers

## Prerequisites

1. **Azure CLI** - Install and configure Azure CLI
   ```bash
   az login
   ```

2. **Terraform** - Install Terraform (version 0.14+ recommended)

3. **Azure Subscription** - Ensure you have an active Azure subscription with appropriate permissions

## Quick Start

1. Clone or download this repository
2. Copy the example variables file:
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```
3. Edit `terraform.tfvars` with your desired values
4. Initialize Terraform:
   ```bash
   terraform init
   ```
5. Plan the deployment:
   ```bash
   terraform plan
   ```
6. Apply the configuration:
   ```bash
   terraform apply
   ```

## Configuration

### Variables

| Variable | Description | Default | Required |
|----------|-------------|---------|----------|
| `resource_group_name` | Name of the resource group | `rg-terraform-blob-storage` | No |
| `location` | Azure region | `East US` | No |
| `storage_account_prefix` | Storage account name prefix | `tfblobstorage` | No |
| `account_tier` | Storage account tier | `Standard` | No |
| `account_replication_type` | Replication type | `LRS` | No |
| `container_names` | List of container names | `["terraform-blob-container", "logs", "backups"]` | No |
| `container_access_type` | Container access level | `private` | No |
| `environment` | Environment tag | `dev` | No |
| `purpose` | Purpose tag | `terraform-demo` | No |

### Outputs

After successful deployment, the following outputs will be available:
- `storage_account_name` - The name of the created storage account
- `storage_account_connection_string` - Primary connection string (sensitive)
- `storage_account_primary_access_key` - Primary access key (sensitive)
- `storage_account_blob_endpoint` - Blob service endpoint URL
- `container_names` - List of created container names
- `resource_group_name` - Name of the resource group

## File Structure

```
.
├── main.tf                    # Main Terraform configuration
├── variables.tf               # Variable definitions
├── outputs.tf                 # Output definitions
├── terraform.tfvars.example   # Example variables file
└── README.md                  # This file
```

## Features

- **Unique Naming**: Storage account names are made unique using random strings
- **Flexible Configuration**: Easily customize through variables
- **Multiple Containers**: Create multiple blob containers in one deployment
- **Secure Outputs**: Sensitive information marked appropriately
- **Validation**: Input validation for critical variables
- **Tags**: Consistent tagging for resource management

## Usage Examples

### Basic Usage
```bash
terraform init
terraform plan
terraform apply
```

### Custom Configuration
Create a `terraform.tfvars` file:
```hcl
resource_group_name = "my-storage-rg"
location           = "West US 2"
container_names    = ["documents", "images", "videos"]
environment        = "production"
```

### Destroy Resources
```bash
terraform destroy
```

## Security Notes

- Storage account keys and connection strings are marked as sensitive
- Default container access is set to private
- Consider implementing additional security measures for production use

## Troubleshooting

### Common Issues

1. **Storage Account Name Conflicts**: Storage account names must be globally unique. The configuration uses random suffixes to avoid conflicts.

2. **Permission Errors**: Ensure your Azure account has sufficient permissions to create resources in the subscription.

3. **Region Availability**: Some Azure regions may not support all storage account features.

## Contributing

Feel free to submit issues and enhancement requests!