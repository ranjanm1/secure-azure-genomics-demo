variable "location" {
  description = "Azure region"
  type        = string
}

variable "project_name" {
  description = "Project short name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space for the VNet"
  type        = list(string)
}

variable "app_subnet_prefix" {
  description = "CIDR for app subnet"
  type        = string
}

variable "data_subnet_prefix" {
  description = "CIDR for data subnet"
  type        = string
}

variable "private_endpoint_subnet_prefix" {
  description = "CIDR for private endpoint subnet"
  type        = string
}

variable "storage_account_name" {
  description = "Globally unique storage account name"
  type        = string
}

variable "tenant_id" {
  description = "Azure AD tenant ID"
  type        = string
}