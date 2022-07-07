variable "identifier" {
  type = object({
      primary = string
      secondary = string
      type = string
  })
}

variable "service_plan" {
    type = object({
        sku_name = string
        os_type = string
    })
    default = {
        sku_name = "P1v2"
        os_type = "Linux"
    }
}

variable "resources" {
  type = map(object({
      resource_group_name = string
      appsettings = object({})
      location = string
  }))
}

variable "database_id" {
  type = string
}
