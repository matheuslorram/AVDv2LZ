# variables.tf
variable "resource_group_name" {
    description = "The name of the resource group"
    type        = string
}

variable "location" {
    description = "The location of the resource group"
    type        = string
}

variable "workspace_name" {
    description = "The name of the Log Analytics Workspace"
    type        = string
}

variable "retention_in_days" {
    description = "The retention period for the logs in days"
    type        = number
    default     = 30
}
variable "sku" {
    description = "The SKU of the Log Analytics Workspace"
    type        = string
    default     = "PerGB2018"
  
}