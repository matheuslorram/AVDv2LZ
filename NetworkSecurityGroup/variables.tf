variable "name" {
  type        = string
  description = "The name of the network security group."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the network security group."
}

variable "location" {
  type        = string
  description = "The location/region where the network security group is created. "
}

variable "inbound_rules" {
  type        = list(map(string))
  default     = []
  description = "List of objects that represent the configuration of each inbound rule."
  }

variable "outbound_rules" {
  type        = list(map(string))
  default     = []
  description = "List of objects that represent the configuration of each outbound rule."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags to assign to the resource."
}

# variable "subnets_ids" {
#   type = list(string)
#  # default     = []
#   description = "List of objects that represent the configuration of each subnet."
# }

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