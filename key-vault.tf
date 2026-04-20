data "azurerm_user_assigned_identity" "jenkins" {
  name                = "jenkins-${var.env}-mi"
  resource_group_name = "managed-identities-${var.env}-rg"
}

module "shared_vault" {
  source                  = "git@github.com:hmcts/cnp-module-key-vault?ref=master"
  name                    = "dm-${var.env}"
  product                 = var.product
  env                     = var.env
  tenant_id               = var.tenant_id
  object_id               = var.jenkins_AAD_objectId
  jenkins_object_id       = data.azurerm_user_assigned_identity.jenkins.principal_id
  resource_group_name     = azurerm_resource_group.shared_rg.name
  product_group_object_id = "be8b3850-998a-4a66-8578-da268b8abd6b"
  create_managed_identity = true
  common_tags             = local.tags
}

output "vaultName" {
  value = module.shared_vault.key_vault_name
}

output "vaultUri" {
  value = module.shared_vault.key_vault_uri
}
