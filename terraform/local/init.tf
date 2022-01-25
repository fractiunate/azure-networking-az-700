# Define Terraform provider
terraform {
}
#Configure the Azure Provider
provider "azurerm" {
  environment = var.environment
  subscription_id = var.azure_subscription_id
  client_id = var.azure_client_id
  client_secret = var.azure_client_secret
  tenant_id = var.azure_tenant_id
}

# Azure authentication variables
variable "azure_subscription_id" {
  type = string
  description = "Azure Subscription ID"
}

variable "azure_client_id" {
  type = string
  description = "Azure Client ID"
}

variable "azure_client_secret" {
  type = string
  description = "Azure Client Secret"
}

variable "azure_tenant_id" {
  type = string
  description = "Azure Tenant ID"
}