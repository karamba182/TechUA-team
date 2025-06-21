# TeachUA Terraform Infrastructure

## Modular Structure

Infrastructure is organized into modules for better organization and reusability:

```
terraform/
├── main.tf                   # Main configuration
├── variables.tf              # Main variables
├── terraform.tfvars.example  # Configuration example
└── modules/
    ├── network/              # VPC and networking
    ├── instances/            # VM instances
    ├── database/             # Cloud SQL PostgreSQL
    ├── firewall/             # Firewall rules
    └── local_provision/      # SSH configuration
```

## Usage

1. **Setup variables**
   ```bash
   cd terraform
   cp terraform.tfvars.example terraform.tfvars
   # Edit terraform.tfvars with your project_id
   ```

2. **Initialize**
   ```bash
   terraform init
   ```

3. **Deploy**
   ```bash
   terraform plan
   terraform apply
   ```

## Modules

### network
- Creates VPC network
- Outputs: compute_network

### instances
- Creates 3 VMs: bastion, backend, frontend
- Outputs: bastion, back, front, back_external_ip

### database
- Cloud SQL PostgreSQL
- Automatic password generation
- Secret Manager for storing credentials
- Outputs: database_connection, jdbc_connection_string

### firewall
- Opens ports: 22, 3001, 3002

### local_provision
- Configures SSH keys

## Database Configuration

Database is configured on free tier:
- Instance: db-f1-micro
- Disk: 10GB PD_HDD
- Region: us-central1

## Destroying Infrastructure

```bash
terraform destroy
```

**Note**: To delete the database, you might need to first disable `deletion_protection`. 