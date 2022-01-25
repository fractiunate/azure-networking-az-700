
resource "azurerm_network_security_group" "network_stack_sg" {
  name                = "network-stack-sg"
  location            = azurerm_resource_group.network_stack.location
  resource_group_name = azurerm_resource_group.network_stack.name
}

resource "azurerm_virtual_network" "network_stack_vnet0" {
  name                = "network-stack-vnet0"
  location            = azurerm_resource_group.network_stack.location
  resource_group_name = azurerm_resource_group.network_stack.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"] # Custom DNS can be provided

  tags = {
    environment = var.environment,
    location = var.location
  }
}


resource "azurerm_subnet" "vnet0_public_subnet_0" {
  name                 = "vnet0-public-subnet-0"
  resource_group_name  = azurerm_resource_group.network_stack.name
  virtual_network_name = azurerm_virtual_network.network_stack_vnet0.name
  address_prefixes     = ["10.0.1.0/24"]
  
  # delegation {
  #   name = "delegation"

  #   service_delegation {
  #     name    = "Microsoft.ContainerInstance/containerGroups"
  #     actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
  #   }
  # }
}

resource "azurerm_subnet" "vnet0_private_subnet_0" {
  name                 = "vnet0-private-subnet-0"
  resource_group_name  = azurerm_resource_group.network_stack.name
  virtual_network_name = azurerm_virtual_network.network_stack_vnet0.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_subnet" "vnet0_managed_subnet_0" {
  name                 = "vnet0-public-subnet-0"
  resource_group_name  = azurerm_resource_group.network_stack.name
  virtual_network_name = azurerm_virtual_network.network_stack_vnet0.name
  address_prefixes     = ["10.0.3.0/24"]
}

