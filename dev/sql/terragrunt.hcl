# include "root" {
#   path = find_in_parent_folders("dev.terragrunt.hcl")
# }
include "global" {
  path = "${get_terragrunt_dir()}/../../_base_modules/global.hcl"
  expose = true
  merge_strategy = "deep"
}

include "sql" {
  path = "${get_terragrunt_dir()}/../../_base_modules/sql/sql.hcl"
  expose = true
  merge_strategy = "deep"
}

include "dev" {
  path = "../dev.hcl"
  expose = true
  merge_strategy = "deep"
}


locals {

}
inputs = {
    resource_group_name = "dev_east"
}
