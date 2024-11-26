data "azurerm_virtual_network" "FSLogix_Network" {
  name                = var.network_name
  resource_group_name = var.resource_group_name
}
resource "azurerm_private_dns_zone" "PrivateDNS" {
  name                = "privatelink.file.core.windows.net"
  resource_group_name = var.resource_group_name
  tags = var.tags
}
resource "azurerm_private_dns_zone_virtual_network_link" "example" {
  name                  = "nic-${var.ProjectName}-${var.environment}"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.PrivateDNS.name
  virtual_network_id    = data.azurerm_virtual_network.FSLogix_Network.id
  registration_enabled = true
}
#Cria um private endpoint para a conta de armazenamento
resource "azurerm_private_endpoint" "storage_account_private_endpoint" {
  name                = "pe-sto-${var.ProjectName}-${var.environment}"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
  tags = var.tags

  private_service_connection {
    name                           = "psc-${var.ProjectName}-${var.environment}"
    private_connection_resource_id = var.storage_account_id
    subresource_names              = ["file"]
    is_manual_connection = false
  }
}


