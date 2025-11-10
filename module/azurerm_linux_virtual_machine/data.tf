
data "azurerm_subnet" "snet" {
  for_each = var.virtual_machine
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "pip" {
  for_each = var.virtual_machine
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault" "kv" {
  name                = "todokeyvault1"
  resource_group_name = "jitu-rg"
}

data "azurerm_key_vault_secret" "username" {
  name         = "vm-username"
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "password" {
  name         = "vm-password1"
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_network_interface" "nic" {
  name                = "frontend_nic"
  resource_group_name = "jitu-rg"
}

data "azurerm_network_security_group" "nsg" {
  name                = "todo-nsg"
  resource_group_name = "jitu-rg"
}