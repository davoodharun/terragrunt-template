# terragrunt-template
This is a sample repository that is preconfigured to provision the following resources using Terragrunt:
- App service plan
- App Service
- SQL database server
- SQL database

## Prerequisites
1. [Terraform CLI](https://www.terraform.io/downloads)
2. [Terragrunt CLI](https://terragrunt.gruntwork.io/docs/getting-started/install/)
3. [Azure Subscription](https://azure.microsoft.com/en-us/)
4. [Az CLI](https://docs.microsoft.com/en-us/cli/azure/)

## Quick start
1. Run ```az login``` and ensure you are connected to the proper subscription
2. Run ```terraform init``` from within ```/bootstrap``` folder
3. Run ```terraform apply``` in ```/bootstrap``` folder; this will create several resource groups and a storage account.
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