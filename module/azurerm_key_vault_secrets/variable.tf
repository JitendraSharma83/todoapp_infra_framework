variable "key_vault_secret" {
  type = map(object({
    name  = string
    value = string
  }))
}
