data "azurerm_mssql_server" "sql" {
  name                = "mssqlserver"
  resource_group_name = "jitu-rg"
}
