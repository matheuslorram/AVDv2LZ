variable "name" {
  type        = string
  description = "The name of the network security group."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the network security group."
}

variable "inbound_rules" {
  type = list(object({
    name                      = string
    priority                  = number
    access                    = string
    protocol                  = string
    source_address_prefix     = optional(string, "*")
    source_port_range         = optional(string, "*")
    destination_address_prefix = optional(string, "*")
    destination_port_range    = optional(string, "*")
    description               = optional(string, null)
  }))
  default     = []
  description = "List of objects that represent the configuration of each inbound rule."
}

variable "outbound_rules" {
  type = list(object({
    name                      = string
    priority                  = number
    access                    = string
    protocol                  = string
    source_address_prefix     = optional(string, "*")
    source_port_range         = optional(string, "*")
    destination_address_prefix = optional(string, "*")
    destination_port_range    = optional(string, "*")
    description               = optional(string, null)
  }))
  default     = []
  description = "List of objects that represent the configuration of each outbound rule."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags to assign to the resource."
}

# variable "tags" {
#   description = "Tags para os recursos"
#   type        = map(string)
#   default = {
#     superintendencia     = ""
#     responsavel_projeto  = ""
#     gerencia_projeto     = ""
#     nome_projeto         = ""
#     organization_devops  = ""
#     centro_custo         = ""
#     chamado              = ""
#   }  
# }