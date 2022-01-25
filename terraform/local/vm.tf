# Create a Virtual Machine
resource "azurerm_virtual_machine" "vm_main" {
  name                  = var.VM_NAME
  location              = azurerm_resource_group.network_stack.location
  resource_group_name   = azurerm_resource_group.network_stack.name
  network_interface_ids = [azurerm_network_interface.vm_mic_main.id]
  vm_size               = "Standard_B1ms"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "${var.VM_NAME}-OS"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "StandardSSD_LRS"
    disk_size_gb      = 32
  }

  os_profile {
    computer_name  = var.VM_NAME
    admin_username = var.VM_ADMIN
  }

  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
      key_data = var.DEFAULT_SSHKEY
      path     = "/home/azure-admin/.ssh/authorized_keys"
    }
  }

  tags = {
    environment = var.environment
    deployment  = "terraform"
  }
}

# Create a Network Interface 
resource "azurerm_network_interface" "vm_mic_main" {
  name                = "${var.VM_NAME}-nic01"
  location            = azurerm_resource_group.network_stack.location
  resource_group_name = azurerm_resource_group.network_stack.name

  ip_configuration {
    name                          = "ipconfiguration01"
    subnet_id                     = azurerm_subnet.vnet0_public_subnet_0.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm_public_ip_main.id
  }
}

# Create a Public IP
resource "azurerm_public_ip" "vm_public_ip_main" {
  name                = "${var.VM_NAME}-publicip01"
  resource_group_name = azurerm_resource_group.network_stack.name
  location            = azurerm_resource_group.network_stack.location
  allocation_method   = "Static"
}