# resource group variable
variable "rgs" {
  description = "creat resource group of club member"
  type = map(object({
    name       = string
    location   = string
    managed_by = optional(string)
    tags       = optional(map(string), {})
  }))
}

# virtual network variable
variable "vnets" {
  description = "creat virtual network for club"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    subnet = optional(map(object({
      name             = string
      address_prefixes = list(string)
    })))
    tags = optional(map(string), {})
  }))
}

# public_ip variable
variable "pip1" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    allocation_method   = string
  }))
}

# virtual machine variable
variable "vm1" {
  type = map(object({
    nic_name                         = string
    location                      = string
    resource_group_name           = string
    name                          = string
    private_ip_address_allocation = string
    subnet_name                   = string
    virtual_network_name          = string
    pip_name                      = string
    vm_name                       = string
    size                          = string
    # admin_username                = string
    # admin_password                = string
  }))
}

# nsg variable
variable "nsg" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
  }))
}

# key_vault variable
variable "todo-keyvault" {
  type = map(object({
  name                        = string
  location                    = string
  resource_group_name         = string
  enabled_for_disk_encryption = bool
  tenant_id                   = string
  soft_delete_retention_days  = number
  purge_protection_enabled    = bool
  }))
}