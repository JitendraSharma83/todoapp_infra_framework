variable "virtual_machine" {
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

# variable "data_subnet" {
#   type = map(object({
#     name          = string
#     virtual_network_name = string
#     resource_group_name  = string
#   }))
# }

# variable "data_pip" {
#   type = map(object({
#     name                = string
#     resource_group_name = string
#   }))
# }

# variable "todo_vm" {
#   type = map(object({
#     name                  = string
#     resource_group_name   = string
#     location              = string
#     size                  = string
#     admin_username        = string
#     admin_password        = string
#     # network_interface_ids = list(string)
#   }))
# }

