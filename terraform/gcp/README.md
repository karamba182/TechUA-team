# TeachUA GCP Infrastructure

This directory contains Terraform configuration for deploying TeachUA infrastructure on Google Cloud Platform.

## Components

### Existing Infrastructure (main.tf)
- VPC Network
- Compute Instances (bastion, backend, frontend)
- Firewall rules
- SSH key management

### Database Infrastructure (database.tf)
- Cloud SQL PostgreSQL instance (free tier eligible)
- Database and user creation
- Secret Manager for credentials
- Automatic backups

## Prerequisites

1. Google Cloud SDK installed and authenticated
2. Terraform >= 1.0
3. GCP Project with billing enabled
4. Required APIs will be enabled automatically

## Quick Start

1. **Initialize Terraform**
   ```bash
   terraform init
   ```

2. **Deploy the database**
   ```bash
   terraform plan
   terraform apply
   ```

3. **Migrate existing data**
   ```bash
   ./scripts/migrate-database.sh
   ```

4. **Test connection**
   ```bash
   ./scripts/test-database-connection.sh
   ```

## Free Tier Considerations

The database configuration uses `db-f1-micro` which is eligible for GCP's free tier:
- 0.6 GB RAM
- Shared vCPU
- Up to 30 GB storage (we use 10 GB)
- Located in us-central1

**Important**: Monitor your usage to stay within free tier limits.

## Files Overview

- `main.tf` - Core infrastructure (VMs, network, firewall)
- `database.tf` - Cloud SQL PostgreSQL configuration
- `database-migration.md` - Detailed migration guide
- `scripts/migrate-database.sh` - Automated migration script
- `scripts/test-database-connection.sh` - Connection testing script

## Security Notes

1. The database initially allows connections from anywhere (0.0.0.0/0)
2. After migration, update `database.tf` to restrict access
3. Credentials are stored in Google Secret Manager
4. Consider using Cloud SQL Proxy for production

## Managing the Database

### Get connection details
```bash
terraform output database_connection
terraform output jdbc_connection_string
```

### Access credentials
```bash
gcloud secrets versions access latest --secret="teachua-db-connection"
```

### Connect to database
```bash
# Get connection info
source <(terraform output -json database_connection | jq -r '@sh "DB_HOST=\(.host)\nDB_USER=\(.username)\nDB_NAME=\(.database)"')

# Get password
DB_PASSWORD=$(gcloud secrets versions access latest --secret="teachua-db-connection" | jq -r '.password')

# Connect
PGPASSWORD=$DB_PASSWORD psql -h $DB_HOST -U $DB_USER -d $DB_NAME
```

## Troubleshooting

### Connection issues
- Ensure your IP is whitelisted
- Check if Cloud SQL instance is running
- Verify GCP project selection

### Cost concerns
- Monitor Cloud SQL metrics
- Check free tier usage in GCP Console
- Consider stopping instance when not in use

## Next Steps

1. Remove public access after migration
2. Set up Cloud SQL Proxy
3. Configure SSL/TLS
4. Set up monitoring alerts
5. Plan for backup/recovery procedures 