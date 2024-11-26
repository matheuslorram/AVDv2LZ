variable "resource_group_name" {
  description = "The name of the resource group in which to create the storage account."  
}

variable "resource_group_location" {
  description = "The location of the resource group in which to create the storage account."  
}

variable "storage_account_name" {
  description = "The name of the storage account."  
}

variable "subnet_id" {
  description = "The ID of the subnet in which to create the private endpoint."  
}

variable "storage_account_id" {
  description = "The ID of the storage account to create the private endpoint for."    
}
variable "environment" {
  description = "The environment to deploy the resources to."
  type        = string
  
}
variable "ProjectName" {
  description = "The name of the project."
  type        = string
  
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
variable "network_name" {
  description = "The name of the virtual network."
  type        = string
}