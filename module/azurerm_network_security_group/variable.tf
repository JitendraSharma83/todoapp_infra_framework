variable "network_security_group" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
  }))
}
