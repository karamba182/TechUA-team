#!/bin/bash

# Test Database Connection Script
# This script tests the connection to the Cloud SQL database

set -e

echo "=== Testing Cloud SQL Database Connection ==="
echo

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Get current directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TERRAFORM_DIR="$SCRIPT_DIR/.."

cd "$TERRAFORM_DIR"

# Check if terraform state exists
if [ ! -f "terraform.tfstate" ]; then
    echo -e "${RED}Error: Terraform state not found. Please run 'terraform apply' first.${NC}"
    exit 1
fi

# Get connection details
echo "Getting connection details from Terraform..."
DB_HOST=$(terraform output -json database_connection 2>/dev/null | jq -r '.host')
DB_NAME=$(terraform output -json database_connection 2>/dev/null | jq -r '.database')
DB_USER=$(terraform output -json database_connection 2>/dev/null | jq -r '.username')

if [ -z "$DB_HOST" ] || [ "$DB_HOST" = "null" ]; then
    echo -e "${RED}Error: Could not get database connection details from Terraform.${NC}"
    echo "Please ensure the database has been deployed with 'terraform apply'."
    exit 1
fi

echo -e "${GREEN}Database connection details:${NC}"
echo "Host: $DB_HOST"
echo "Database: $DB_NAME"
echo "Username: $DB_USER"
echo

# Get password from Secret Manager
echo "Retrieving database password from Secret Manager..."
DB_PASSWORD=$(gcloud secrets versions access latest --secret="teachua-db-connection" 2>/dev/null | jq -r '.password')

if [ -z "$DB_PASSWORD" ] || [ "$DB_PASSWORD" = "null" ]; then
    echo -e "${RED}Error: Could not retrieve password from Secret Manager.${NC}"
    exit 1
fi

# Test connection
echo -e "\n${YELLOW}Testing database connection...${NC}"
PGPASSWORD=$DB_PASSWORD psql -h $DB_HOST -U $DB_USER -d $DB_NAME -c "SELECT version();" 2>/dev/null

if [ $? -eq 0 ]; then
    echo -e "\n${GREEN}✓ Database connection successful!${NC}"
    
    # Show some basic database info
    echo -e "\n${YELLOW}Database Information:${NC}"
    PGPASSWORD=$DB_PASSWORD psql -h $DB_HOST -U $DB_USER -d $DB_NAME -t -c "
    SELECT 'Database Size: ' || pg_size_pretty(pg_database_size(current_database()));
    "
    
    PGPASSWORD=$DB_PASSWORD psql -h $DB_HOST -U $DB_USER -d $DB_NAME -t -c "
    SELECT 'Number of Tables: ' || count(*) FROM information_schema.tables WHERE table_schema = 'public';
    "
    
    echo -e "\n${YELLOW}Tables in database:${NC}"
    PGPASSWORD=$DB_PASSWORD psql -h $DB_HOST -U $DB_USER -d $DB_NAME -c "
    SELECT table_name FROM information_schema.tables WHERE table_schema = 'public' ORDER BY table_name;
    "
else
    echo -e "\n${RED}✗ Database connection failed!${NC}"
    echo
    echo "Possible issues:"
    echo "1. Check if your IP is whitelisted in the Cloud SQL authorized networks"
    echo "2. Verify the Cloud SQL instance is running in the GCP Console"
    echo "3. Check firewall rules"
    echo "4. Ensure you have the correct GCP project selected"
    exit 1
fi

echo -e "\n${GREEN}Connection test completed.${NC}" 