# resource "azurerm_virtual_wan" "network_stack_wan0" {
#   name                = "network-stack-vwan"
#   resource_group_name = azurerm_resource_group.network_stack.name
#   location            = azurerm_resource_group.network_stack.name.location
# }

# resource "azurerm_route_table" "network_stack-udr-table" {
#   name                          = "example-route-table"
#   location                      = azurerm_resource_group.network_stack.location
#   resource_group_name           = azurerm_resource_group.network_stack.name
#   disable_bgp_route_propagation = false

#   route {
#     name           = "internet-route"
#     address_prefix = "0.0.0.0/0" # public internet
#     next_hop_type  = "Internet"
#   }

#   tags = {
#     environment = var.environment
#   }
# }


# resource "azurerm_virtual_hub" "network_stack_vh0" {
#   name                = "network-stack-hub"
#   resource_group_name = azurerm_resource_group.network_stack.name
#   location            = azurerm_resource_group.network_stack.name.location
#   virtual_wan_id      = azurerm_virtual_wan.network_stack_wan0.id
#   address_prefix      = "10.0.1.0/24"
# }

# resource "azurerm_virtual_hub_connection" "network_stack_vh0_connection" {
#   name                      = "network-stack-vhub"
#   virtual_hub_id            = azurerm_virtual_hub.network_stack_vh0.id
#   remote_virtual_network_id = azurerm_virtual_network.network_stack_vnet0.id
# }