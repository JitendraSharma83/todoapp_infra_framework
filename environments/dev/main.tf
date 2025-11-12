module "rg" {
  source   = "../../module/azurerm_resource_group"
  resource = var.rgs
}

module "vnet" {
   depends_on = [ module.rg ]
  source          = "../../module/azurerm_virtual_network"
  virtual_network = var.vnets
}

module "public_ip" {
  depends_on = [ module.rg ]
  source    = "../../module/azurerm_public_ip"
  public_ip = var.pip1
}

module "vm" {
  depends_on = [ module.rg ]
  source          = "../../module/azurerm_linux_virtual_machine"
  virtual_machine = var.vm1
}

module "nsg" {
  depends_on = [ module.rg ]
  source                 = "../../module/azurerm_network_security_group"
  network_security_group = var.nsg
}

module "kv" {
  depends_on = [ module.rg ]
  source    = "../../module/azurerm_key_vault"
  key_vault = var.todo-keyvault
}

module "storage" {
  depends_on = [ module.rg ]
  source          = "../../module/azurerm_storage_account"
  storage_account = var.stgs
}

module "sql" {
  depends_on = [ module.rg ]
  source         = "../../module/azurerm_mysql_server"
  mssql_server = var.mssql_todo
}

module "db" {
  depends_on = [ module.sql ]
  source = "../../module/azurerm_mysql_database"
  mssql_database = var.todo_db
}

module "key_vault_secret" {
  depends_on = [ module.kv , module.rg ]
  source = "../../module/azurerm_key_vault_secrets"
  key_vault_secret = var.secrets
}