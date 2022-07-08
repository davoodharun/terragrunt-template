remote_state {
  backend = "azurerm"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    resource_group_name  = "shared"
    storage_account_name = "4a16aa0287e60d48tf"
    container_name       = "example"
    key            = "example/${path_relative_to_include()}.tfstate"
  }
}


generate "provider" {
    path = "provider.tf"
    if_exists = "overwrite"
    contents = <<EOF
provider "azurerm"  { 
    skip_provider_registration = true
    version             = "= 3.10.0"
    features {}
}
EOF
}

inputs = {
    identifier = {
        primary = "EXAMPLE"
    }
}