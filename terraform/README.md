# TeachUA Terraform Infrastructure

## Модульна структура

Інфраструктура розділена на модулі для кращої організації та повторного використання:

```
terraform/
├── main.tf                   # Основна конфігурація
├── variables.tf              # Головні змінні
├── terraform.tfvars.example  # Приклад конфігурації
└── modules/
    ├── network/              # VPC та мережа
    ├── instances/            # VM інстанси
    ├── database/             # Cloud SQL PostgreSQL
    ├── firewall/             # Правила firewall
    └── local_provision/      # SSH налаштування
```

## Використання

1. **Налаштування змінних**
   ```bash
   cd terraform
   cp terraform.tfvars.example terraform.tfvars
   # Відредагуйте terraform.tfvars з вашим project_id
   ```

2. **Ініціалізація**
   ```bash
   terraform init
   ```

3. **Розгортання**
   ```bash
   terraform plan
   terraform apply
   ```

## Модулі

### network
- Створює VPC мережу
- Outputs: compute_network

### instances
- Створює 3 VM: bastion, backend, frontend
- Outputs: bastion, back, front, back_external_ip

### database
- Cloud SQL PostgreSQL
- Автоматична генерація пароля
- Secret Manager для зберігання credentials
- Outputs: database_connection, jdbc_connection_string

### firewall
- Відкриває порти: 22, 3001, 3002

### local_provision
- Налаштовує SSH ключі

## Конфігурація бази даних

База даних налаштована на free tier:
- Instance: db-f1-micro
- Disk: 10GB PD_HDD
- Region: us-central1

## Видалення інфраструктури

```bash
terraform destroy
```

**Примітка**: Для видалення бази даних може знадобитися спочатку вимкнути `deletion_protection`. 