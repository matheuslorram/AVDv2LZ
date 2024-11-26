output "peer1-to-peer2" {
  value       = azurerm_virtual_network_peering.peer1-to-peer2.name
  description = "The virtual network peering name of peering 1 to peering 2."
}

output "peer2-to-peer1" {
  value       = azurerm_virtual_network_peering.peer2-to-peer1.name
  description = "The virtual network peering name of peering 2 to peering 1."
}
