variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the storage account."
}

variable "resource_group_location" {
  type        = string
  description = "The location of the resource group in which to create the storage account."  
}

variable "avd_users" {
  description = "AVD users"
  default = [
    "matheus.lorram@technosit.com.br",
    "karine.reis@technosit.com.br"
  ]
}

variable "aad_group_name" {
  type        = string
  default     = "AVDUsers"
  description = "Azure Active Directory Group for AVD users"
}