module "shared_vault" {
  source                  = "git@github.com:hmcts/cnp-module-key-vault?ref=master"
  name                    = "dm-${var.env}"
  product                 = var.product
  env                     = var.env
  tenant_id               = var.tenant_id
  object_id               = var.jenkins_AAD_objectId
  resource_group_name     = azurerm_resource_group.shared_rg.name
  product_group_name      = "dcd_em"
  create_managed_identity = true
  common_tags             = local.tags
}

output "vaultName" {
  value = module.shared_vault.key_vault_name
}

output "vaultUri" {
  value = module.shared_vault.key_vault_uri
}
