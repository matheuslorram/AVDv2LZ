# Configuração do Terraform, especificando a versão necessária e os provedores necessários
terraform {
  # A versão mínima do Terraform requerida para esta configuração
  required_version = ">=1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
  # Configuração do backend para armazenar o estado Terraform em uma conta de armazenamento Azure
  backend "azurerm" {
    resource_group_name  = "rg-tech-prd"
    storage_account_name = "stoavdhml00"
    container_name       = "terraform-state"
    key                  = "infraestrutura-central.tfstate"
  }
}

# Configuração do provedor Azure, sem recursos específicos habilitados : Aplicaitivo deve ter permissão de contributor na assinatura para conseguir realizar os provisionamentos
provider "azurerm" {
  features {}

  subscription_id = ""
  tenant_id       = ""
  client_id       = ""
  client_secret   = ""
}

# Recursos Comuns
module "Resource_Group_Infraestrutura_Central" {
  source                          = "./ResourceGroup"
  azurerm_resource_group_name     = "rg-eastus2-infraestrutura-central"
  azurerm_resource_group_location = var.location
  tags = {
    Projeto = "Azure Virtual Desktop"
  }
}
module "Network_Hub_central" {
  source                      = "./VirtualNetwork"
  network_name                = "vnet-hub-central-contoso"
  resource_group_name_network = module.Resource_Group_Infraestrutura_Central.name
  location                    = var.location
  address_space               = ["172.16.80.0/22"]
  subnets                     = var.subnets
  depends_on                  = [module.Resource_Group_Infraestrutura_Central]
}
module "Network_Security_Group_Hub_Central" {
  source              = "./NetworkSecurityGroup"
  resource_group_name = module.Resource_Group_Infraestrutura_Central.name
  location            = var.location
  tags = {
    Projeto = "Azure Virtual Desktop"
  }
  name       = var.network_security_group_name
  depends_on = [module.Network_Hub_central]
}
module "Network_Security_Group_Rules_Hub_Central" {
  source              = "./NetworkSecurityGroupRules"
  resource_group_name = module.Resource_Group_Infraestrutura_Central.name
  name                = var.network_security_group_name
  inbound_rules = [
    {
      name                       = "AllowRDP"
      priority                   = 1000
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "3389"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    {
      name                       = "AllowHTTP"
      priority                   = 1001
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "3390 "
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  ]
  depends_on = [module.Network_Security_Group_Hub_Central]
}
module "NetoworksecurityGroupAssociate" {
  source               = "./NetworkSecurityGroupAssociate"
  resource_group_name  = module.Resource_Group_Infraestrutura_Central.name
  subnet_name          = "snet-avd-hosts"
  nsg_name             = var.network_security_group_name
  virtual_network_name = module.Network_Hub_central.name

  depends_on = [module.Network_Security_Group_Rules_Hub_Central]

}
module "Storage_Account_Infraestrutura_Central" {
  source                   = "./StorageAccount"
  resource_group_name      = module.Resource_Group_Infraestrutura_Central.name
  resource_group_location  = var.location
  account_tier             = "Premium"
  account_replication_type = "LRS"
  projectName              = "infracental"
  environment              = "prd"
}
module "Storage_Account_FSLogix" {
  source                  = "./StorageAccountFSLogix"
  resource_group_name     = module.Resource_Group_Infraestrutura_Central.name
  resource_group_location = var.location
  aad_group_name          = var.aad_group_name
  avd_users               = var.avd_users
}
module "Storage_PrivateEndpoint_FSLogix" {
  source                  = "./StoragePrivateLink"
  storage_account_name    = module.Storage_Account_FSLogix.storage_account_name
  resource_group_name     = module.Resource_Group_Infraestrutura_Central.name
  resource_group_location = var.location
  subnet_id               = module.Network_Hub_central.subnets["snet-services"].id
  storage_account_id      = module.Storage_Account_FSLogix.storage_account_id
  environment             = var.environment
  ProjectName             = var.projectName
  network_name            = module.Network_Hub_central.name
  tags                    = var.tags

  depends_on = [ module.Storage_Account_FSLogix ]
}
module "LogAnalytics_AzureVirtualDesktop" {
  source              = "./LogAnalyticsWorkspace"
  resource_group_name = module.Resource_Group_Infraestrutura_Central.name
  location            = var.location
  workspace_name      = var.log_analytics_name_AzureVirtualDesktop_name
  retention_in_days   = 30
  sku                 = "PerGB2018"

}