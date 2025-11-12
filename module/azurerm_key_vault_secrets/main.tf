resource "azurerm_key_vault_secret" "kvs" {
  for_each = var.key_vault_secret
  name         = each.value.name
  value        = each.value.value
  key_vault_id = data.azurerm_key_vault.kv.id
}

