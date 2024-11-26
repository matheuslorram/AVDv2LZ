variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the virtual network peering."
}

variable "local_virtual_network_id" {
  type        = string
  description = "The full Azure resource ID of the remote virtual network."
}

variable "local_virtual_network_name" {
  type        = string
  description = "The full Azure resource ID of the remote virtual network."
}

variable "remote_virtual_network_id" {
  type        = string
  description = "The name of the resource group in which to create the virtual network peering."
}

variable "remote_virtual_network_name" {
  type        = string
  description = "The name of the resource group in which to create the virtual network peering."
}
