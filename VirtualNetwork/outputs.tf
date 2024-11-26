output "id" {
  value       = azurerm_virtual_network.virtual_network.id
  description = "The virtual network configuration ID."
}

output "guid" {
  value       = azurerm_virtual_network.virtual_network.guid
  description = "The GUID of the virtual network."
}

output "name" {
  value       = azurerm_virtual_network.virtual_network.name
  description = "The name of the virtual network."
}

output "resource_group_name" {
  value       = azurerm_virtual_network.virtual_network.resource_group_name
  description = "The name of the resource group in which to create the virtual network."
}

output "location" {
  value       = azurerm_virtual_network.virtual_network.location
  description = "The location/region where the virtual network is created."
}

output "address_space" {
  value       = azurerm_virtual_network.virtual_network.address_space
  description = "The list of address spaces used by the virtual network."
}

output "dns_servers" {
  value       = azurerm_virtual_network.virtual_network.dns_servers
  description = "The list of DNS servers used by the virtual network."
}

output "ddos_protection_plan" {
  value       = azurerm_virtual_network.virtual_network.ddos_protection_plan
  description = "Block containing configuration of ddos protection plan."
}

output "subnets" {
  value       = { for subnet in azurerm_subnet.subnets : subnet.name => subnet }
  description = "Blocks containing configuration of each subnet."
  # module.MODULE_NAME.subnets["SUBNET_NAME"].id
}

output "subnets_ids" {
  value       = [for subnet in azurerm_subnet.subnets : subnet.id]
  description = "Blocks containing configuration of each subnet."
  # module.MODULE_NAME.subnets["SUBNET_NAME"].id
}

