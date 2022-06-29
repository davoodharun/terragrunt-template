locals {
    keyvault_name = "XZE-E-N-EUWEB-D-KVT-10"
    keyvault_resource_group_name = "XZE-E-N-EUWEB00-D-RGP-10"
    settings_keys = {
        kvref = local.keyvault_name
        # opco = upper(var.identifier.primary)
    }
}

inputs = {
    keyvault_name = local.keyvault_name
    keyvault_resource_group_name = local.keyvault_resource_group_name
    docker_image_name = "eubpapi"
    docker_image_tag = "latest"
    appserviceplan = {
        sku_name = "B2"
        os_type = "Linux"
    }
}
