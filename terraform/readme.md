After terraform apply, inventory is generated based on Terraform outputs.

```bash
ansible -i ../terraform/azure/inventory.yml all -m ping
```
Connection successful — inventory works dynamically from Terraform outputs.

WARNING !!! In next version terraform output -json > terraform_outputs.json for cration outputs 


from ansible dir 
RUN 

``` 
ansible -i ../terraform/azure/inventory.yml all -m ping
```

