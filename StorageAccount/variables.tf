variable "account_tier" {
  type        = string
  description = "Defines the Tier to use for this storage account. Valid options are Standard and Premium."  
}

variable "account_replication_type" {
  type        = string
  description = "Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS, RA_GZRS."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the storage account."
}

variable "resource_group_location" {
  type        = string
  description = "The location of the resource group in which to create the storage account."  
}
variable "projectName" {
  type        = string
  description = "The name of the project"  
}
variable "environment" {
  type        = string
  description = "The environment to deploy the resources to."  
}
variable "tags" {
  description = "Tags para os recursos"
  type        = map(string)
  default = {
    superintendencia     = ""
    responsavel_projeto  = ""
    gerencia_projeto     = ""
    nome_projeto         = ""
    organization_devops  = ""
    centro_custo         = ""
    chamado              = ""
  }  
}