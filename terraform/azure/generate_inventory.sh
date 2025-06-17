#!/bin/bash

# Получаем JSON output Terraform
TF_OUTPUT=$(terraform output -json)

# Извлекаем значения с помощью jq
FRONTEND_PUBLIC_IP=$(echo "$TF_OUTPUT" | jq -r '.frontend_public_ip.value')
BACKEND_PUBLIC_IP=$(echo "$TF_OUTPUT" | jq -r '.backend_public_ip.value')
FRONTEND_PRIVATE_IP=$(echo "$TF_OUTPUT" | jq -r '.frontend_private_ip.value')
BACKEND_PRIVATE_IP=$(echo "$TF_OUTPUT" | jq -r '.backend_private_ip.value')
KEY_VAULT_URI=$(echo "$TF_OUTPUT" | jq -r '.key_vault_uri.value')
POSTGRES_FQDN=$(echo "$TF_OUTPUT" | jq -r '.postgres_fqdn.value')

# Генерируем Ansible inventory
cat <<EOF > inventory.yml
all:
  vars:
    key_vault_uri: "$KEY_VAULT_URI"
    postgres_fqdn: "$POSTGRES_FQDN"
  hosts:
    frontend:
      ansible_host: $FRONTEND_PUBLIC_IP
      ansible_user: azureuser
      private_ip: $FRONTEND_PRIVATE_IP
    backend:
      ansible_host: $BACKEND_PUBLIC_IP
      ansible_user: azureuser
      private_ip: $BACKEND_PRIVATE_IP
EOF

echo "✅ Inventory успешно создан: inventory.yml"
