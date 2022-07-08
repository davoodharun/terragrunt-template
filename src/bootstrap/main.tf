
provider "azurerm"  { 
  skip_provider_registration = true
  features {}

}

locals {
    resource_groups = {
        shared = {
            name = "shared"
            location = "East US"
        }
        dev_east = {
            name = "dev_east"
            location = "East US"
        }
        test_east = {
            name = "test_east"
            location = "East US"
        }
        stage_east = {
            name = "stage_east"
            location = "East US"
        }
        stage_central = {
            name = "stage_central"
            location = "Central US"
        }
        prod_east = {
            name = "prod_east"
            location = "East US"
        }
        prod_central = {
            name = "prod_central"
            location = "Central US"
        }
    }
}

resource "azurerm_resource_group" "rgs" {
    for_each = local.resource_groups
    name     = each.value.name
    location = each.value.location
}



resource "random_id" "id" {
	  byte_length = 8
}

locals { 
  storage_name = "${random_id.id.hex}tf"
}

resource "azurerm_storage_account" "example" {
  name                     = local.storage_name
  resource_group_name      = azurerm_resource_group.rgs["shared"].name
  location                 = azurerm_resource_group.rgs["shared"].location
  account_tier             = "Standard"
  account_replication_type = "GRS"

}
resource "azurerm_storage_container" "terraform_state"  { 
  name = "example"  
  storage_account_name = azurerm_storage_account.example.name
}