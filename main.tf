locals {
  tags = var.common_tags
}

resource "azurerm_resource_group" "shared_rg" {
  name     = "${var.product}-shared-${var.env}"
  location = var.location

  tags = local.tags
}

provider "azurerm" {
  features {}
}

resource "azurerm_key_vault_secret" "slack_monitoring_address" {   
  name         = "slack_monitoring_address"   
  value        = var.email_address   
  key_vault_id = data.azurerm_key_vault.rd_key_vault.id 
}