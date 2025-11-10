module "rg" {
  source   = "../../module/azurerm_resource_group"
  resource = var.rgs
}

module "vnet" {
  source          = "../../module/azurerm_virtual_network"
  virtual_network = var.vnets
}

module "public_ip" {
  source    = "../../module/azurerm_public_ip"
  public_ip = var.pip1
}

module "vm" {
  source          = "../../module/azurerm_linux_virtual_machine"
  virtual_machine = var.vm1
}

module "nsg" {
  source = "../../module/azurerm_network_security_group"
  network_security_group = var.nsg
}

module "kv" {
  source = "../../module/azurerm_key_vault"
  key_vault = var.todo-keyvault
}