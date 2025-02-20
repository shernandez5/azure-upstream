# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

component "rg" {
  source = "./rg"

  inputs = {
    resource_group_name     = "stacks-demo-resources"
    resource_group_location = "East US"
  }

  providers = {
    azurerm = provider.azurerm.this
  }
}

component "networking" {
  source = "./networking"

  inputs = {
    resource_group_name     = component.rg.resource_group_name
    resource_group_location = component.rg.resource_group_location
  }

  providers = {
    azurerm = provider.azurerm.this
  }
}

output "resource_group_name" {
  value = component.rg.resource_group_name
  type = string
}

output "resource_group_location" {
  value = component.rg.resource_group_location
  type = string
}

output "nic_id" {
  value = component.networking.nic_id
  type = string
}
