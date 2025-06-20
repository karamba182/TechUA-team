#!/bin/bash

# Update database configuration from Terraform outputs
# Usage: ./scripts/update-database-config.sh

set -e

echo "Updating database configuration from Terraform..."

# Colors for output  
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$SCRIPT_DIR/.."
TERRAFORM_DIR="$PROJECT_ROOT/terraform"
SETENV_FILE="$PROJECT_ROOT/setenv.sh"

# Check if terraform directory exists
if [ ! -d "$TERRAFORM_DIR" ]; then
    echo -e "${RED}ERROR: Terraform directory not found: $TERRAFORM_DIR${NC}"
    exit 1
fi

# Check if setenv.sh exists
if [ ! -f "$SETENV_FILE" ]; then
    echo -e "${RED}ERROR: setenv.sh not found: $SETENV_FILE${NC}"
    exit 1
fi

cd "$TERRAFORM_DIR"

# Check if terraform state is accessible
if ! terraform state list &>/dev/null; then
    echo -e "${RED}ERROR: Terraform state not accessible. Please run 'terraform apply' first.${NC}"
    exit 1
fi

# Get database connection details from terraform
echo "Getting database connection details from Terraform..."

DB_HOST=$(terraform output -json database_connection 2>/dev/null | jq -r '.host')
DB_NAME=$(terraform output -json database_connection 2>/dev/null | jq -r '.database')
DB_USER=$(terraform output -json database_connection 2>/dev/null | jq -r '.username')

if [ -z "$DB_HOST" ] || [ "$DB_HOST" = "null" ]; then
    echo -e "${RED}ERROR: Could not get database host from Terraform output${NC}"
    exit 1
fi

echo -e "${GREEN}Database details retrieved:${NC}"
echo "   Host: $DB_HOST"
echo "   Database: $DB_NAME" 
echo "   Username: $DB_USER"

# Create backup of current setenv.sh
BACKUP_FILE="$SETENV_FILE.backup.$(date +%Y%m%d_%H%M%S)"
cp "$SETENV_FILE" "$BACKUP_FILE"
echo -e "${YELLOW}Backup created: $BACKUP_FILE${NC}"

# Generate database-config.env file
echo "Generating database-config.env..."

DATABASE_CONFIG_FILE="$PROJECT_ROOT/database-config.env"

# Get the current password from setenv.sh (or use default)
DB_PASSWORD=$(grep "DEV2_DATASOURCE_PASSWORD" "$SETENV_FILE" | grep -v "^#" | sed 's/.*="\(.*\)"/\1/' | head -1)
if [ -z "$DB_PASSWORD" ]; then
    DB_PASSWORD="TeachUA2024!secure"
fi

# Create database-config.env with current terraform outputs
cat > "$DATABASE_CONFIG_FILE" << EOF
# Database configuration from Terraform
# Updated: $(date)
export DEV2_DATASOURCE_URL="jdbc:postgresql://$DB_HOST:5432/$DB_NAME"
export DEV2_DATASOURCE_USER="$DB_USER"
export DEV2_DATASOURCE_PASSWORD="$DB_PASSWORD"

export PROD_DATASOURCE_URL="jdbc:postgresql://$DB_HOST:5432/$DB_NAME"
export PROD_DATASOURCE_USER="$DB_USER"
export PROD_DATASOURCE_PASSWORD="$DB_PASSWORD"
EOF

echo -e "${GREEN}Database configuration updated successfully!${NC}"
echo
echo -e "${YELLOW}Generated file: database-config.env${NC}"
echo "   DEV2_DATASOURCE_URL: jdbc:postgresql://$DB_HOST:5432/$DB_NAME"
echo "   PROD_DATASOURCE_URL: jdbc:postgresql://$DB_HOST:5432/$DB_NAME"
echo
echo -e "${GREEN}Run 'source setenv.sh' to load the updated configuration${NC}" 