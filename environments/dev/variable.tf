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
    nic_name                      = string
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

# storage variable
variable "stgs" {
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
    tags                     = optional(map(string), {})
  }))
}

variable "mssql_todo" {
  type = map(object({
    name                         = string
    resource_group_name          = string
    location                     = string
    version                      = string
    administrator_login          = string
    administrator_login_password = string
    minimum_tls_version          = string
    tags                         = optional(map(string), {})
  }))
}

variable "todo_db" {
  description = "azure SQL Database details "
  type = map(object({
    name         = string
    collation    = string
    license_type = string
    max_size_gb  = string
    sku_name     = string
    enclave_type = string
    tags         = optional(map(string), {})
  }))
}

variable "secrets" {
  type = map(object({
    name  = string
    value = string
  }))
}