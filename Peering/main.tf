resource "azurerm_virtual_network_peering" "peer1-to-peer2" {
  name                         = "${var.local_virtual_network_name}-to-${var.remote_virtual_network_name}"
  resource_group_name          = var.resource_group_name
  virtual_network_name         = var.local_virtual_network_name
  remote_virtual_network_id    = var.remote_virtual_network_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "peer2-to-peer1" {
  name                         = "${var.remote_virtual_network_name}-to-${var.local_virtual_network_name}"
  resource_group_name          = var.resource_group_name
  virtual_network_name         = var.remote_virtual_network_name
  remote_virtual_network_id    = var.local_virtual_network_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}