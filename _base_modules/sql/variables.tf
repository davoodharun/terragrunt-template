variable "identifier" {
  type = object({
      primary = string
      secondary = string
      type = string
  })
}


variable "resource_group_name" {
    type = string
  
}
