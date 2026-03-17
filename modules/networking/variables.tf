variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "vnet_address_space" {
  type = list(string)
}

variable "app_subnet_prefix" {
  type = string
}

variable "data_subnet_prefix" {
  type = string
}

variable "private_endpoint_subnet_prefix" {
  type = string
}