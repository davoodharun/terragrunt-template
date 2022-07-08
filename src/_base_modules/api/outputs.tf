# output "site_names" {
#     value =  [for o in module.api : o.site_name]
# }

# output "app_names" {
#     value =  [for o in module.api : o.app_name]
# }

output "database_id" {
  value = var.database_id
}