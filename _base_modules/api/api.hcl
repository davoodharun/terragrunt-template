terraform {
  source = "${get_terragrunt_dir()}/../../../../_base_modules/api"

  extra_arguments "common_vars" {
    commands = get_terraform_commands_that_need_vars()

    required_var_files = [
      
    ]
  }
}

inputs = {
    identifier = {
        primary = "EUBNPAPI"
    }
}
# dependency "vpc" {
#   config_path = "../vpc"
# }

# dependency "mysql" {
#   config_path = "../mysql"
# }

# inputs = {
#   primary_id = "EUBPAPI"
# }