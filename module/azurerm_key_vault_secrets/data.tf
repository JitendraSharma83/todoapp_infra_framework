data "azurerm_key_vault" "kv" {
  name                = "todokeyvault1"
  resource_group_name = "jitu-rg"
}