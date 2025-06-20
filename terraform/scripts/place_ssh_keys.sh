#!/bin/bash

export USER="devops"
export KEYS_DIR="."
BASTION_KEYS=()

generate_keys() (
  yes y | ssh-keygen -f link -N '' -t ed25519
)

wait_for_readiness () (
  HOST="$1"
  shift
  while ! gcloud compute ssh "$USER"@"$HOST" --command=true $@
  do
    sleep 1
  done
)

place_public_key () (
  SRC="$1"
  HOST="$2"
  shift 2
  gcloud compute scp "$SRC" "$USER"@"$HOST":/home/"$USER"/pubkey $@
  gcloud compute ssh "$USER"@"$HOST" --command='cat pubkey >> ~/.ssh/authorized_keys' $@
  gcloud compute ssh "$USER"@"$HOST" --command='rm pubkey' $@
  )

generate_keys

for host in back front bastion
do
  wait_for_readiness "$host" $@
  place_public_key "$KEYS_DIR"/link.pub "$host" $@
done

wait_for_readiness bastion $@
gcloud compute scp "$KEYS_DIR"/link "$USER"@bastion:~/.ssh/id_ed25519 $@
rm -f link*

for access_key in ../pubkeys/*.pub $BASTION_KEYS
do
  place_public_key $access_key bastion $@
done

gcloud compute config-ssh
