#!/bin/bash
USER=devops

gcloud compute ssh "$USER"@bastion --ssh-flag=-t $@ << 'EOF'
for inport_dsthost in '3001:back' '3002:front'
do
  ssh -fN -oStrictHostKeyChecking=no -oUpdateHostKeys=yes -L bastion:"$inport_dsthost":22 localhost
done
exit
EOF
