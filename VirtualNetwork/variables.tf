variable "network_name" {
  type        = string
  description = "The name of the virtual network."
}

variable "resource_group_name_network" {
  type        = string
  description = "The name of the resource group in which to create the virtual network."
}

variable "location" {
  type        = string
  description = "The location/region where the virtual network is created."
}

variable "address_space" {
  type        = list(string)
  description = "The address space that is used in the virtual network. More than one address space can be provisioned."
}

variable "dns_servers" {
  type        = list(string)
  default     = []
  description = "List of IP addresses of DNS servers."
}

variable "subnets" {
  type = list(object({
    name                                          = string
    address_prefixes                              = list(string)
    service_endpoints                             = optional(list(string))
    delegation                                    = optional(string)
    private_endpoint_network_policies_enabled     = optional(bool)
    private_link_service_network_policies_enabled = optional(bool)
  }))
  default     = []
  description = "List of objects that represent the configuration of each subnet."
}

variable "delegation_name" {
  type        = string
  default     = null
  description = "The name of the service delegation."
  
}

variable "delegation_actions" {
  type        = list(string)
  default     = []
  description = "The list of actions to be delegated."
  
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