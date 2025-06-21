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

export USER="devops"
export KEYS_DIR="."
BASTION_KEYS=()

# Add initial delay to ensure instances are fully initialized
echo "Waiting 30 seconds for instances to initialize..."
sleep 30

generate_keys() (
  ssh-keygen -f link -N '' -t ed25519
)

wait_for_readiness () (
  local host=$1
  local max_attempts=60
  local attempt=0
  
  echo "Waiting for $host to be ready..."
  while ! gcloud compute ssh "$USER"@"$host" --command=true --zone="$ZONE" --project="$PROJECT" --tunnel-through-iap 2>/dev/null
  do
    attempt=$((attempt + 1))
    if [ $attempt -ge $max_attempts ]; then
      echo "ERROR: Timeout waiting for $host to be ready after $max_attempts attempts"
      return 1
    fi
    echo "Attempt $attempt/$max_attempts: $host not ready yet, waiting 5 seconds..."
    sleep 5
  done
  echo "$host is ready!"
)

place_public_key () (
  local key_file=$1
  local host=$2
  echo "Placing public key from $key_file to $host..."
  gcloud compute scp "$key_file" "$USER"@"$host":~/pubkey --zone="$ZONE" --project="$PROJECT" --tunnel-through-iap
  gcloud compute ssh "$USER"@"$host" --command='cat pubkey >> ~/.ssh/authorized_keys' --zone="$ZONE" --project="$PROJECT" --tunnel-through-iap
  gcloud compute ssh "$USER"@"$host" --command='rm pubkey' --zone="$ZONE" --project="$PROJECT" --tunnel-through-iap
  echo "Public key placed on $host"
  )

generate_keys

for host in back front bastion
do
  if ! wait_for_readiness "$host"; then
    echo "ERROR: Failed to connect to $host"
    exit 1
  fi
  if ! place_public_key "$KEYS_DIR"/link.pub "$host"; then
    echo "ERROR: Failed to place public key on $host"
    exit 1
  fi
done

if ! wait_for_readiness bastion; then
  echo "ERROR: Failed to connect to bastion"
  exit 1
fi

echo "Copying private key to bastion..."
if ! gcloud compute scp "$KEYS_DIR"/link "$USER"@bastion:~/.ssh/id_ed25519 --zone="$ZONE" --project="$PROJECT" --tunnel-through-iap; then
  echo "ERROR: Failed to copy private key to bastion"
  exit 1
fi
rm -f link*

for access_key in ../pubkeys/*.pub $BASTION_KEYS
do
  if [ -f "$access_key" ]; then
    echo "Processing access key: $access_key"
    if ! place_public_key "$access_key" bastion; then
      echo "WARNING: Failed to place access key $access_key on bastion"
    fi
  fi
done

echo "Updating SSH config..."
# Set the gcloud context before running config-ssh
gcloud config set compute/zone "$ZONE"
gcloud config set core/project "$PROJECT"
gcloud compute config-ssh

echo "SSH keys deployment completed successfully!"
