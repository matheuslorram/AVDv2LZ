variable "azurerm_resource_group_name" {
  type = string
}

variable "azurerm_resource_group_location" {
  type = string
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