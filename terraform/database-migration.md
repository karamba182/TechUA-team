# Database Migration to GCP Cloud SQL

This guide helps you migrate your TeachUA PostgreSQL database to Google Cloud Platform using Cloud SQL.

## Prerequisites

1. Google Cloud SDK installed and configured
2. Terraform installed
3. Access to your current PostgreSQL database
4. GCP project with billing enabled (free tier available)

## Free Tier Details

The configuration uses Cloud SQL with `db-f1-micro` tier which includes:
- 0.6 GB RAM
- Shared CPU
- 10 GB storage
- Located in us-central1

**Note**: The free tier has usage limits. Monitor your usage to avoid charges.

## Deployment Steps

### 1. Initialize Terraform

```bash
cd terraform/gcp
terraform init
```

### 2. Plan the deployment

```bash
terraform plan
```

### 3. Apply the configuration

```bash
terraform apply
```

This will create:
- Cloud SQL PostgreSQL instance
- Database named 'teachua'
- User 'teachua_user' with a random password
- Connection details stored in Secret Manager

### 4. Get connection details

After deployment, get the connection information:

```bash
terraform output database_connection
terraform output jdbc_connection_string
```

### 5. Migrate existing data

Export your existing database:
```bash
pg_dump -h localhost -U pmp2025 -d teachua > teachua_backup.sql
```

Import to Cloud SQL:
```bash
# Get the Cloud SQL instance IP
CLOUD_SQL_IP=$(terraform output -json database_connection | jq -r '.host')

# Get the password from Secret Manager
gcloud secrets versions access latest --secret="teachua-db-connection" | jq -r '.password'

# Import the data
psql -h $CLOUD_SQL_IP -U teachua_user -d teachua < teachua_backup.sql
```

### 6. Update application configuration

Update your environment variables in `setenv.sh`:

```bash
# Get the JDBC URL
export DEV2_DATASOURCE_URL=$(terraform output -raw jdbc_connection_string)
export DEV2_DATASOURCE_USER="teachua_user"
# Get password from Secret Manager or Terraform output
export DEV2_DATASOURCE_PASSWORD="<password-from-secret-manager>"
```

## Security Considerations

1. The current configuration allows connections from anywhere (0.0.0.0/0) for initial setup
2. After migration, update `database.tf` to remove the "allow-all" authorized network
3. Use Cloud SQL Proxy for production connections
4. Enable SSL for database connections

## Monitoring and Maintenance

1. Monitor free tier usage in GCP Console
2. Regular backups are configured for 3:00 AM daily
3. Consider enabling point-in-time recovery for production use

## Troubleshooting

### Connection Issues
- Ensure your IP is whitelisted in authorized networks
- Check firewall rules
- Verify the database instance is running

### Performance Issues
- The f1-micro tier has limited resources
- Consider upgrading to a larger instance for production use
- Monitor connection pool settings

## Cost Optimization

To stay within free tier:
- Keep disk usage under 30GB total across all services
- Monitor compute hours
- Use connection pooling to minimize connections
- Consider using Cloud SQL only for production, local PostgreSQL for development 