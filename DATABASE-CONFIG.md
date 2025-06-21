# Database Configuration

Quick script to sync database IP address from Terraform.

## Usage

After deploying infrastructure:
```bash
./scripts/update-database-config.sh
source setenv.sh
```

## What it does

- Reads database IP from terraform state
- Updates `database-config.env` file  
- `setenv.sh` loads the updated config automatically

## Files

- `database-config.env` - generated config (gitignored)
- `setenv.sh` - loads config or uses defaults
- `scripts/update-database-config.sh` - sync script