# include "root" {
#   path = find_in_parent_folders("test.terragrunt.hcl")
# }

include "global" {
  path = "${get_terragrunt_dir()}/../../_base_modules/global.hcl"
  expose = true
  merge_strategy = "deep"
}

include "api" {
  path = "${get_terragrunt_dir()}/../../_base_modules/api/api.hcl"
  expose = true
  merge_strategy = "deep"
}

include "test" {
  path = "../test.hcl"
  expose = true
  merge_strategy = "deep"
}

dependency "sql" {
  config_path = "../sql"
    mock_outputs = {
    database_id = "temporary-dummy-id"
  }
}

locals {
    keyvault_name = "XZE-E-N-EUWEB-D-KVT-10"
    keyvault_resource_group_name = "XZE-E-N-EUWEB00-D-RGP-10"
    settings_keys = {
        kvref = local.keyvault_name
        # opco = upper(var.identifier.primary)
    }
}
inputs = {
    database_id = dependency.sql.outputs.database_id
    keyvault_name = local.keyvault_name
    keyvault_resource_group_name = local.keyvault_resource_group_name
    appserviceplan = {
        sku_name = "P1v2"
        os_type = "Linux"
    }
    resources = {
        east = {
            resource_group_name = "test_east"
            location = "East US"
            # merge app settings template files
            appsettings = jsondecode(templatefile("test.east.appsettings.tpl", local.settings_keys))
        }
    }
    tags = {
    }
}
