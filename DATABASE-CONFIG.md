# Database Configuration Management

## Problem
Cloud SQL Database IP address may change when instance is recreated through Terraform, which requires manual updates to `setenv.sh` file.

## Solution
Automatic database configuration updates from Terraform outputs.

## Usage

### Automatic update
```bash
# After terraform apply
./scripts/update-database-config.sh
```

### Load configuration
```bash
source setenv.sh
```

## Configuration Files

### `database-config.env`
- **Purpose**: File with current IP addresses from Terraform
- **Source**: Terraform outputs
- **Status**: Added to `.gitignore`

### `setenv.sh`
- **Change**: Now automatically loads `database-config.env`
- **Fallback**: Uses hardcoded values if file is missing

## Workflow

### Steps:
1. **Deploy infrastructure**: `terraform apply`
2. **Update config**: `./scripts/update-database-config.sh` 
3. **Load environment**: `source setenv.sh`
4. **Start application**: App uses current database IP

## Script `update-database-config.sh`

### Functionality:
- Gets current IP address from Terraform state
- Creates backup of current `setenv.sh`
- Generates new `database-config.env`
- Supports fallback values

### Example output:
```bash
Updating database configuration from Terraform...
Getting database connection details from Terraform...
Database details retrieved:
   Host: 104.198.44.61
   Database: teachua
   Username: teachua_user
Backup created: setenv.sh.backup.20241205_143022
Generating database-config.env...
Database configuration updated successfully!

Generated file: database-config.env
   DEV2_DATASOURCE_URL: jdbc:postgresql://104.198.44.61:5432/teachua
   PROD_DATASOURCE_URL: jdbc:postgresql://104.198.44.61:5432/teachua

Run 'source setenv.sh' to load the updated configuration
```

## Important

### After each terraform apply:
```bash
./scripts/update-database-config.sh
source setenv.sh
```

### For CI/CD deployment:
```bash
# In CI/CD pipeline
terraform apply
./scripts/update-database-config.sh
# Application will use current IP address
```

## Alternative Solutions

### Option 1: DNS Alias
```hcl
# Add DNS record in terraform
resource "google_dns_record_set" "database" {
  name         = "database.teachua.internal."
  type         = "A"
  ttl          = 300
  managed_zone = google_dns_managed_zone.private.name
  rrdatas      = [google_sql_database_instance.teachua_db.private_ip_address]
}
```

### Option 2: Environment Variables from CI/CD
```yaml
# GitHub Actions
- name: Update Database Config
  run: |
    DB_HOST=$(terraform output -json database_connection | jq -r '.host')
    echo "DEV2_DATASOURCE_URL=jdbc:postgresql://$DB_HOST:5432/teachua" >> $GITHUB_ENV
```

## Recommendations

1. Run script after each terraform apply
2. Check database-config.env before deploy
3. Use backup files in case of issues
4. Consider DNS alias for production 