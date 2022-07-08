output "storage_account_name" {
    value =  azurerm_storage_account.example.name
}

output "storage_account_resource_group" {
    value =  azurerm_resource_group.rgs["shared"].name
}

output "container_name" {
    value =  azurerm_storage_container.terraform_state.name
}