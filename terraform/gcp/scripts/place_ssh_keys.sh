#!/bin/bash

export USER="devops"
export KEYS_DIR="."
BASTION_KEYS=()

generate_keys() (
  ssh-keygen -f link -N '' -t ed25519
)

wait_for_readiness () (
  while ! gcloud compute ssh "$USER"@"$1" --command=true
  do
    sleep 1
  done
)

place_public_key () (
  gcloud compute scp "$1" "$USER"@"$2":~/pubkey
  gcloud compute ssh "$USER"@"$2" --command='cat pubkey >> ~/.ssh/authorized_keys'
  gcloud compute ssh "$USER"@"$2" --command='rm pubkey'
  )

generate_keys

for host in back front bastion
do
  wait_for_readiness "$host"
  place_public_key "$KEYS_DIR"/link.pub "$host"
done

wait_for_readiness bastion
gcloud compute scp "$KEYS_DIR"/link "$USER"@bastion:~/.ssh/id_ed25519
rm -f link*

for access_key in ../pubkeys/*.pub $BASTION_KEYS
do
  place_public_key $access_key bastion
done

gcloud compute config-ssh
