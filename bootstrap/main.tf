
provider "azurerm"  { 
  skip_provider_registration = true
  features {}

}

resource "azurerm_resource_group" "example" {
  name     = "TerragruntExample"
  location = "East US"
}

resource "random_id" "id" {
	  byte_length = 8
}

locals { 
  storage_name = "${random_id.id.hex}tf"
}

resource "azurerm_storage_account" "example" {
  name                     = local.storage_name
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

}
resource "azurerm_storage_container" "terraform_state"  { 
  name = "example"  
  storage_account_name = azurerm_storage_account.example.name
}