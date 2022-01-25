resource "azurerm_resource_group" "network_stack" {
  name     = "network-stack"
  location = var.location
}


# resource "azurerm_public_ip" "lb_public_ip" {
#   name                = "PublicIPForLB"
#   location            = var.location
#   resource_group_name = azurerm_resource_group.network_stack.name
#   allocation_method   = "Static"
# }

# resource "azurerm_lb" "incoming_lb" {
#   name                = "AZLoadBalancer"
#   location            = var.location
#   resource_group_name = azurerm_resource_group.network_stack.name

#   frontend_ip_configuration {
#     name                 = "PublicIPAddress"
#     public_ip_address_id = azurerm_public_ip.lb_public_ip.id
#   }
# }


# resource "azurerm_lb_backend_address_pool" "lb_backend_address_pool" {
#   loadbalancer_id = azurerm_lb.incoming_lb.id
#   name            = "BackEndAddressPool"
# }

