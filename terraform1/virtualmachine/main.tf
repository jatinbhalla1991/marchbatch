
resource "azurerm_virtual_network" "example" {
  name                = var.vnet_name
  location            =  var.location
  resource_group_name = "demo-rg-${var.env}"
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "example" {
  name                 = "example-subnet"
  resource_group_name  = "demo-rg-${var.env}"
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "example" {
  name                = "example-nic"
  location           =  var.location
  resource_group_name = "demo-rg-${var.env}"

  ip_configuration {
    name                          = "example-ip-config"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "example" {
  name                = "example-vm"
  location           =  var.location 
  resource_group_name = "demo-rg-${var.env}"
  network_interface_ids = [
    azurerm_network_interface.example.id
  ]
  vm_size             = "Standard_B1ms"
  
  storage_os_disk {
    name              = "example-os-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    # managed           = true
    disk_size_gb      = 30
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_profile {
    computer_name  = "hostname"
    admin_username = "adminuser"
    admin_password = "P@ssw0rd1234"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = {
    environment = "development"
  }
}