terraform
├── main.tf
├── modules
│   ├── database
│   │   ├── aws
│   │   ├── azure
│   │   └── gcp
│   ├── firewall
│   │   ├── aws
│   │   ├── azure
│   │   └── gcp
│   │       ├── module.tf
│   │       └── variables.tf
│   ├── instances
│   │   ├── aws
│   │   ├── azure
│   │   └── gcp
│   │       ├── module.tf
│   │       ├── outputs.tf
│   │       └── variables.tf
│   ├── local_provision
│   │   ├── aws
│   │   ├── azure
│   │   └── gcp
│   │       ├── module.tf
│   │       └── variables.tf
│   ├── network
│   │   ├── aws
│   │   ├── azure
│   │   └── gcp
│   │       ├── module.tf
│   │       ├── outputs.tf
│   │       └── variables.tf
│   └── proxy
│       ├── aws
│       ├── azure
│       └── gcp
├── scripts
│   ├── place_ssh_keys.sh
│   └── setup_ssh_gateway.sh
├── terraform_structure.md
├── variables.auto.tfvars
└── variables.tf
