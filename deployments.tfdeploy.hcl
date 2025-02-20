# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

store "varset" "tokens" {
  id       = "varset-ghrHJqshEhbLtQub"
  category = "env"
}

deployment "production" {
  inputs = {
    client_id       = "510491dd-6d30-4888-bc94-49e993c7fb1a"
    client_secret   = store.varset.tokens.client_secret
    subscription_id = "c192c791-b58a-4925-81ae-058e7aa48b8a"
    tenant_id       = "237fbc04-c52a-458b-af97-eaf7157c0cd4"
  }
}

publish_output "resource_group_name" {
  value = deployment.production.resource_group_name
}

publish_output "resource_group_location" {
  value = deployment.production.resource_group_location
}

publish_output "nic_id" {
  value = deployment.production.nic_id
}