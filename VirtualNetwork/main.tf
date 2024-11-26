resource "azurerm_virtual_network" "virtual_network" {
  name                = var.network_name
  resource_group_name = var.resource_group_name_network
  location            = var.location
  tags                = var.tags
  address_space       = var.address_space
  #dns_servers         = var.dns_servers

}

resource "azurerm_subnet" "subnets" {
  for_each             = { for subnet in var.subnets : subnet.name => subnet }
  name                 = each.value.name
  resource_group_name  = var.resource_group_name_network
  virtual_network_name = var.network_name
  address_prefixes     = each.value.address_prefixes

  dynamic "delegation" {
    for_each = each.value.name == "snet-frontend-app" || each.value.name == "snet-backend-app" ? [1] : []
    content {
      name = "web_delegation"
      service_delegation {
        name    = "Microsoft.Web/serverFarms"
        actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
      }
    }
  }
  depends_on = [ azurerm_virtual_network.virtual_network ]
}