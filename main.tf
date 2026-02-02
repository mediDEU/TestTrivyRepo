###############################################################################
terraform {
  required_version = ">= 1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.1.0"
    }
  }
}

#################
resource "azurerm_storage_account" "insecure_storage" {
  name                     = "trivyfailstorage"
  resource_group_name      = "example-resources"
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  # FAIL: This should be set to true to ensure HTTPS only
  enable_https_traffic_only = false 

  # FAIL: This allows public access to the storage account
  allow_nested_items_to_be_public = true 

  # FAIL: Minimum TLS version should be 1.2
  min_tls_version = "TLS1_0"
}

