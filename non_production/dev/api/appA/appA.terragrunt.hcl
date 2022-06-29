include "root" {
  path = find_in_parent_folders()
}

include "env" {
  path = "${get_terragrunt_dir()}/../../../../_base_modules/api/api.hcl"
  expose = true
  merge_strategy = "deep"
}

include "common" {
    path = find_in_parent_folders("dev.env.hcl")
    expose = true
    merge_strategy = "deep"
}

locals {

}

inputs = {
  
    identifier = {
        secondary = "ACE"
    }
    resources = {
        east = {
            resource_group_name = "XZE-E-N-EUDAPI-D-RGP-10"
            apim_instances = {
                ACE = {
                    name = "XZE-E-N-EUDAPI-ACE-D-AMS-01"
                    resource_group_name = "XZE-E-N-EUDAPI-D-RGP-10"
                }
            }
            # merge app settings template files
            appsettings = merge(jsondecode(templatefile("${get_terragrunt_dir()}/../dev.common.appsettings.tpl", include.common.locals.settings_keys)), jsondecode(templatefile("dev.ace.east.appsettings.tpl", include.common.locals.settings_keys)))
        }
    }
    tags = {
    }
}
