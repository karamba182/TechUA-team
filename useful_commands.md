# Development Commands

## Application Deployment

### Frontend Deployment (Production Ready)
```bash
ansible-playbook -i inventory_direct.yml deploy_frontend_only.yml
```

### Backend Deployment (Work in Progress)
```bash
ansible-playbook -i inventory_direct.yml deploy_backend_ultimate.yml
```

### Service Management
```bash
# Check backend service status
ssh -i ~/.ssh/google_compute_engine devops@34.121.241.173 'systemctl status spring-boot'

# Monitor real-time logs
ssh -i ~/.ssh/google_compute_engine devops@34.121.241.173 'journalctl -u spring-boot -f'

# Restart service if needed
ssh -i ~/.ssh/google_compute_engine devops@34.121.241.173 'sudo systemctl restart spring-boot'
```

## Database Operations
```bash
# Connect to production database
psql -h 34.173.19.35 -p 5432 -U teachua_user -d teachua

# Test database connectivity
telnet 34.173.19.35 5432

# Quick connection test
pg_isready -h 34.173.19.35 -p 5432 -U teachua_user
```

## Infrastructure Management

### Terraform Operations
```bash
cd terraform
terraform validate      # Check configuration syntax
terraform plan          # Preview infrastructure changes
terraform apply         # Apply infrastructure changes
terraform destroy       # Remove infrastructure (use with caution!)
```

### GCP Resource Management
```bash
# List compute instances
gcloud compute instances list

# Check firewall configuration
gcloud compute firewall-rules list

# Monitor resource usage
gcloud compute instances describe front-q5z4 --zone=us-central1-a
gcloud compute instances describe back-q685 --zone=us-central1-a
```

## Service Endpoints

Production URLs:
- Frontend: http://34.132.63.67
- Backend API: http://34.121.241.173:8080 (when operational)
- Frontend Load Balancer: http://34.36.132.33
- Backend Load Balancer: http://34.54.161.166:8080

## Development & Debugging

### Backend Troubleshooting
```bash
# View recent backend errors
ssh -i ~/.ssh/google_compute_engine devops@34.121.241.173 'journalctl -u spring-boot -n 50 --no-pager'

# Check Java processes
ssh -i ~/.ssh/google_compute_engine devops@34.121.241.173 'ps aux | grep java'

# Monitor system resources
ssh -i ~/.ssh/google_compute_engine devops@34.121.241.173 'htop'

# Check disk space
ssh -i ~/.ssh/google_compute_engine devops@34.121.241.173 'df -h'
```

### Network Diagnostics
```bash
# Test frontend availability
curl -I http://34.132.63.67

# Test backend port (when running)
telnet 34.121.241.173 8080

# Check network latency
ping 34.173.19.35

# Trace network route
traceroute 34.132.63.67
```

### Google Cloud Console
```bash
# Set active project
gcloud config set project speak-ukrainian-362008

# SSH directly to instances
gcloud compute ssh --zone=us-central1-a devops@back-q685
gcloud compute ssh --zone=us-central1-a devops@front-q5z4

# Copy files to instances
gcloud compute scp local-file.txt devops@back-q685:~/remote-file.txt --zone=us-central1-a
```

## Log Analysis
```bash
# Application logs
ssh -i ~/.ssh/google_compute_engine devops@34.121.241.173 'tail -f /var/log/teachua/application.log'

# System logs
ssh -i ~/.ssh/google_compute_engine devops@34.121.241.173 'tail -f /var/log/syslog'

# Nginx access logs (frontend)
ssh -i ~/.ssh/google_compute_engine devops@34.132.63.67 'tail -f /var/log/nginx/access.log'
```

## Performance Monitoring
```bash
# Check server load
ssh -i ~/.ssh/google_compute_engine devops@34.121.241.173 'uptime'

# Memory usage
ssh -i ~/.ssh/google_compute_engine devops@34.121.241.173 'free -h'

# Database connections
psql -h 34.173.19.35 -p 5432 -U teachua_user -d teachua -c "SELECT count(*) FROM pg_stat_activity;"
``` 