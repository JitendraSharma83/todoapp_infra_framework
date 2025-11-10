resource "azurerm_network_interface_security_group_association" "nsg_association" {
  network_interface_id      = data.azurerm_network_interface.nic.id
  network_security_group_id = data.azurerm_network_security_group.nsg.id
}

resource "azurerm_network_interface" "network" {
  for_each            = var.virtual_machine
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = each.value.name
    subnet_id                     = data.azurerm_subnet.snet[each.key].id
    public_ip_address_id          = data.azurerm_public_ip.pip[each.key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  for_each = var.virtual_machine
  name                = each.value.vm_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = data.azurerm_key_vault_secret.username.value
  admin_password      = data.azurerm_key_vault_secret.password.value
  network_interface_ids = [azurerm_network_interface.network[each.key].id]
  disable_password_authentication = false
  # admin_ssh_key {
  #   username   = "adminuser"
  #   public_key = file("~/.ssh/id_rsa.pub")
  # }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}