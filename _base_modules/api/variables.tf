variable "identifier" {
  type = object({
      primary = string
      secondary = string
  })
}


variable "tags" {
  type = object({})
}

variable "appserviceplan" {
    type = object({
        sku_name = string
        os_type = string
    })
    default = {
        sku_name = "Free"
        os_type = "Linux"
    }
}

variable "devops_creator" {
  type = string
  default = "Eu-DevOps"
}

variable "resources" {
  type = map(object({
     resource_group_name = string
      apim_instances = map(object({
          name = string
          resource_group_name = string
      }))
      appsettings = object({})
  }))
}

variable "keyvault_name" {
  type = string
  description = "name of keyvault app service secrets exist in"
}

variable "keyvault_resource_group_name" {
  type = string
  description = "name of resource group of keyvault"
}

variable docker_image_name {
  type = string
}

variable docker_image_tag {
  type = string
}