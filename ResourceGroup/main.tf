resource "azurerm_resource_group" "resource_group" {
  name     = var.azurerm_resource_group_name
  location = var.azurerm_resource_group_location
  tags = var.tags
}
