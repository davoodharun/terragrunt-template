# terragrunt-template
This is a sample repository that is preconfigured to provision the following resources using Terragrunt:
- App service plan
- App Service
- SQL database server
- SQL database

## Prerequisites
1. Terraform CLI
2. Terragrunt CLI
3. Azure Subscription
4. Az CLI

## Quick start
1. az login
2. Run ```terraform init``` from within ```/bootstrap``` folder
3. Run ```terraform apply``` in ```/bootstrap``` folder
4. Observe command output to grab state file storage account name and container (run ```terraform output``` from within ```/bootstrap``` folder)

```
container_name = "example"
storage_account_name = "4a16aa0287e60d48tf"
storage_account_resource_group = "shared"

```

5. Populate ```_base_modules/global.hcl``` to contain correct storage account information
6. From within any environment folder run, ```terragrunt run-all init```
7. Next run ```terragrunt run-all plan```
8. Finally run ```terragrunt run-all apply``` to provision your infrastructure using Terragrunt.