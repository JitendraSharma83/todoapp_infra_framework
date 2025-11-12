rgs = {
  rg1 = {
    name       = "jitu-rg"
    location   = "west us"
    managed_by = "Jitendra"
    tags = {
      costcenter = 10034
    }
  }
}

vnets = {
  "vnet1" = {
    name                = "frontendvnet1"
    location            = "west us"
    resource_group_name = "jitu-rg"
    address_space       = ["10.0.0.0/16"]
    tags = {
      "name"        = "pool_member"
      "cost_center" = "34567"
    }
    subnet = {
      "subnet1" = {
        name             = "frontend-subnet"
        address_prefixes = ["10.0.1.0/24"]
      }
    }
  }

  "vnet2" = {
    name                = "club-vnet2"
    location            = "west us"
    resource_group_name = "jitu-rg"
    address_space       = ["10.0.0.0/16"]
    tags = {
      "name"        = "pool_member"
      "cost_center" = "34567"
    }
    subnet = {
      "subnet2" = {
        name             = "subnet2"
        address_prefixes = ["10.0.2.0/24"]
      }
    }
  }
}

pip1 = {
  p1 = {
    name                = "todopip1"
    resource_group_name = "jitu-rg"
    location            = "west us"
    allocation_method   = "Static"
  }
}

vm1 = {
  "nic1" = {
    nic_name                      = "frontend_nic"
    location                      = "westus"
    resource_group_name           = "jitu-rg"
    name                          = "internal"
    private_ip_address_allocation = "Dynamic"
    subnet_name                   = "frontend-subnet"
    virtual_network_name          = "frontendvnet1"
    pip_name                      = "todopip1"
    vm_name                       = "todo-vm"
    size                          = "Standard_F2"
    # admin_username                = "adminuser"
    # admin_password                = "Tcs@220819870000"
  }
}

nsg = {
  nsg1 = {
    name                = "todo-nsg"
    location            = "west us"
    resource_group_name = "jitu-rg"
    
    tags = {
      environment = "dev"
    }

    security_rule = {
      sr1 = {
        name                       = "test123"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    }
  }
}

todo-keyvault = {
  kv1 = {
    name                        = "todokeyvault1"
    location                    = "west us"
    resource_group_name         = "jitu-rg"
    enabled_for_disk_encryption = true
    tenant_id                   = "a76f3cd4-c56e-4fd0-b33d-0e4ce344efae"
    soft_delete_retention_days  = 7
    purge_protection_enabled    = false
  }
}

stgs = {
  stg1 = {
    name                     = "tododevstg1"
    resource_group_name      = "jitu-rg"
    location                 = "west us"
    account_tier             = "Standard"
    account_replication_type = "GRS"
    tags = {
      cost_center = 123456
      environment = "dev"
    }
  }
}

mssql_todo = {
  msql1 = {
    name                         = "mssqlserver"
    resource_group_name          = "jitu-rg"
    location                     = "west us"
    version                      = "12.0"
    administrator_login          = "mssqladminuser"
    administrator_login_password = "mssql@123"
    minimum_tls_version          = "1.2"
    tags = {
      environment = "dev"
    }
  }
}

todo_db = {
  sqldb1 = {
    name = "todoapp-db"

    collation    = "SQL_Latin1_General_CP1_CI_AS"
    license_type = "LicenseIncluded"
    max_size_gb  = 2
    sku_name     = "S0"
    enclave_type = "VBS"

    tags = {
      project = "todoapp"
      owner   = "jitendra"
      env     = "dev"
    }
  }
}

secrets = {
  kvs1 = {
    name  = "vm-username"
    value = "adminuser"

  }

  kvs2 = {
    name  = "vm-password1"
    value = "adminuser@123"

  }
}
