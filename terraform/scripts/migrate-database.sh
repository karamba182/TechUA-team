#!/bin/bash

set -e

echo "=== TeachUA Database Migration to GCP Cloud SQL ==="
echo

# Check if required commands are installed
check_command() {
    if ! command -v $1 &> /dev/null; then
        echo "Error: $1 is not installed"
        exit 1
    fi
}

echo "Checking prerequisites..."
check_command terraform
check_command gcloud
check_command psql
check_command pg_dump
check_command jq

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TERRAFORM_DIR="$SCRIPT_DIR/.."

# Source environment variables
if [ -f "$TERRAFORM_DIR/../../setenv.sh" ]; then
    echo "Loading environment variables..."
    source "$TERRAFORM_DIR/../../setenv.sh"
else
    echo "Error: setenv.sh not found"
    exit 1
fi

# Apply Terraform
echo -e "\nApplying Terraform..."
cd "$TERRAFORM_DIR"

if [ ! -f "terraform.tfstate" ]; then
    echo "Initializing Terraform..."
    terraform init
fi

echo "Planning Terraform..."
terraform plan -out=tfplan

echo -e "\nDo you want to apply these changes? (yes/no)"
read -r response
if [[ "$response" != "yes" ]]; then
    echo "Aborting migration."
    exit 0
fi

terraform apply tfplan

# Get connection details
echo -e "\nGetting connection details..."
DB_HOST=$(terraform output -json database_connection | jq -r '.host')
DB_NAME=$(terraform output -json database_connection | jq -r '.database')
DB_USER=$(terraform output -json database_connection | jq -r '.username')
DB_SECRET=$(terraform output -json database_connection | jq -r '.secret')

# Get password from Secret Manager
echo "Getting database password from Secret Manager..."
DB_PASSWORD=$(gcloud secrets versions access latest --secret="teachua-db-connection" | jq -r '.password')

echo "Database connection details:"
echo "Host: $DB_HOST"
echo "Database: $DB_NAME"
echo "Username: $DB_USER"

# Export local database
echo -e "\nExporting local database..."
BACKUP_FILE="teachua_backup_$(date +%Y%m%d_%H%M%S).sql"

# Use environment variables for local database
LOCAL_DB=${DATASOURCE_URL##*/}  # Extract database name from JDBC URL
LOCAL_USER=$DATASOURCE_USER
LOCAL_PASSWORD=$DATASOURCE_PASSWORD

echo "Creating backup of local database..."
PGPASSWORD=$LOCAL_PASSWORD pg_dump -h localhost -U $LOCAL_USER -d $LOCAL_DB > $BACKUP_FILE

if [ $? -eq 0 ]; then
    echo "Backup created successfully: $BACKUP_FILE"
else
    echo "Error creating backup"
    exit 1
fi

# Import to Cloud SQL
echo -e "\nImporting to Cloud SQL..."
echo "this can be loooooong..."

PGPASSWORD=$DB_PASSWORD psql -h $DB_HOST -U $DB_USER -d $DB_NAME < $BACKUP_FILE

if [ $? -eq 0 ]; then
    echo "Database imported successfully!"
else
    echo "Error importing database"
    exit 1
fi

# Update application configuration
echo -e "\nStep 5: Updating application configuration..."
JDBC_URL=$(terraform output -raw jdbc_connection_string)

echo -e "\nMigration completed successfully!"
echo
echo "To update your application configuration, add these to your setenv.sh:"
echo
echo "export DEV2_DATASOURCE_URL=\"$JDBC_URL\""
echo "export DEV2_DATASOURCE_USER=\"$DB_USER\""
echo "export DEV2_DATASOURCE_PASSWORD=\"$DB_PASSWORD\""
echo
echo "Important Security Notes:"
echo "1. Remove the 'allow-all' authorized network from database.tf after migration"
echo "2. Consider using Cloud SQL Proxy for production connections"
echo "3. Enable SSL for database connections"
echo
echo "Backup file saved as: $BACKUP_FILE" 