data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

resource "azurerm_mssql_server" "example" {
  name                         = lower(format("%s-%s-%s", var.identifier.primary, var.identifier.secondary, var.identifier.type))
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = data.azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
}

resource "azurerm_mssql_database" "test" {
  name           = "acctest-db-d"
  server_id      = azurerm_mssql_server.example.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 1
  sku_name       = "S0"
  zone_redundant = false

  tags = {
    foo = "bar"
  }
}