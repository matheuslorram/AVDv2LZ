# generate a random string (consisting of four characters)
# https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string
resource "random_string" "random" {
  length  = 4
  upper   = false
  special = false
}

## Azure Storage Accounts requires a globally unique names
## https://docs.microsoft.com/en-us/azure/storage/common/storage-account-overview
## Create a File Storage Account 
resource "azurerm_storage_account" "storage" {
  name                     = "stofslogixprofile${random_string.random.id}"
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location
  account_tier             = "Premium"
  account_replication_type = "LRS"
  account_kind             = "FileStorage"
  default_to_oauth_authentication = true

}

resource "azurerm_storage_share" "FSShare" {
  name                 = "fslogix"
  storage_account_name = azurerm_storage_account.storage.name
  depends_on           = [azurerm_storage_account.storage]
  quota = 1024
}
resource "azurerm_storage_share_directory" "FSLogixProfile" {
  name                 = "profiles-protheus"
  storage_share_id = azurerm_storage_share.FSShare.id

  depends_on           = [azurerm_storage_share.FSShare]  
}
## Azure built-in roles
## https://docs.microsoft.com/en-us/azure/role-based-access-control/built-in-roles
data "azurerm_role_definition" "storage_role" {
  name = "Storage File Data SMB Share Contributor"
}
data "azuread_group" "aad_group" {
  display_name = var.aad_group_name
}
 
resource "azurerm_role_assignment" "af_role" {
  scope              = azurerm_storage_account.storage.id
  role_definition_id = data.azurerm_role_definition.storage_role.id
  principal_id       = data.azuread_group.aad_group.object_id
}