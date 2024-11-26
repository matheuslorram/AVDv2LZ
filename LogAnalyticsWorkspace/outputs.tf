# outputs.tf
output "log_analytics_workspace_id" {
    description = "The ID of the Log Analytics Workspace"
    value       = azurerm_log_analytics_workspace.log_analytics_workspace.id
}