# Cria uma conta de armazenamento 
# A conta de armazenamento será usada para armazenar perfis de usuário e outras informações relacionadas ao fslogix.
resource "azurerm_storage_account" "storage_account" {
  name                     = "sto${var.projectName}${var.environment}"
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
 
  tags = var.tags
}