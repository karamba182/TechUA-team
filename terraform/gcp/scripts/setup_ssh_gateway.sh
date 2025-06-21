#!/bin/bash

# Parse command line arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    --zone=*)
      export ZONE="${1#*=}"
      shift
      ;;
    --project=*)
      export PROJECT="${1#*=}"
      shift
      ;;
    *)
      echo "Unknown argument: $1"
      exit 1
      ;;
  esac
done

USER=devops

echo "Setting up SSH gateway on bastion host..."
gcloud compute ssh "$USER"@bastion --zone="$ZONE" --project="$PROJECT" --tunnel-through-iap --ssh-flag=-t << 'EOF'
for inport_dsthost in '3001:back' '3002:front'
do
  ssh -fN -oStrictHostKeyChecking=no -oUpdateHostKeys=yes -L bastion:"$inport_dsthost":22 localhost
done
exit
EOF

echo "SSH gateway setup completed!"
