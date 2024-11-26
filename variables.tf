# Variáveis para Configuração Geral
variable "location" {
  description = "Localização  onde os recursos serão criados"
  default     = "eastus2"
  type        = string
}
variable "resource_group_azure_virtual_desktop" {
  description = "Nome do grupo de recursos do Azure Virtual Desktop"
  default     = "rg-eastus2-infraestrutura-central"
  type        = string
}
variable "log_analytics_name_AzureVirtualDesktop_name" {
  description = "Nome do Log Analytics Workspace"
  type        = string
  default     = "law-avd-monitoring"
}
variable "network_security_group_name" {
  description = "Nome do grupo de segurança de rede"
  type        = string
  default     = "nsg-eastus2-avd-hosts-snet"
}
variable "dns_servers" {
  description = "Servidores DNS para a rede virtual"
  type        = list(string)
  default     = [""]
}
variable "virtual_network_name" {
  description = "Nome da rede virtual"
  type        = string
  default     = "vnet-hub-central"
}
variable "subnets" {
  description = "Configurações das sub-redes"
  type = list(object({
    name             = string
    address_prefixes = list(string)
    delegations = list(object({
      name = string
      service_delegation = object({
        name    = string
        actions = list(string)
      })
    }))
    service_endpoints = list(string)
  }))
  default = [
    {
      name              = "snet-avd-hosts"
      address_prefixes  = ["172.16.80.0/24"]
      delegations       = []
      service_endpoints = [""]
    },
    {
      name              = "snet-services"
      address_prefixes  = ["172.16.81.0/24"]
      delegations       = []
      service_endpoints = ["Microsoft.Storage"]
    },
    {
      name              = "GatewaySubnet"
      address_prefixes  = ["172.16.82.0/24"]
      delegations       = []
      service_endpoints = [""]
    }
  ]
}
variable "avd_users" {
  description = "AVD users"
  default = [
    "user@contoso.com.br",
    "user@contoso.com.br"
  ]
}

variable "aad_group_name" {
  type        = string
  default     = "Azure Virtual Desktop Users"
  description = "Azure Active Directory Group for AVD users"
}

variable "tags" {
  description = "Tags para os recursos"
  type        = map(string)
  default = {
    superintendencia    = ""
    responsavel_projeto = ""
    gerencia_projeto    = ""
    nome_projeto        = ""
    organization_devops = ""
    centro_custo        = ""
    chamado             = ""
  }
}
variable "projectName" {
  description = "Nome do projeto"
  type        = string
  default     = "fslogixprofiles"
}
variable "environment" {
  description = "Ambiente de deploy dos recursos"
  type        = string
  default     = "dev"
}