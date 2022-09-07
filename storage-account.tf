#module "storage_account" {
#  source                    = "git@github.com:hmcts/cnp-module-storage-account?ref=master"
#  env                       = "${var.env}"
#  storage_account_name      = "${var.product}shared${var.env}"
#  resource_group_name       = "${azurerm_resource_group.shared_rg.name}"
#  location                  = "${var.location}"
#  account_kind              = "StorageV2"
#  account_tier              = "Standard"
#  account_replication_type  = "LRS"
# access_tier               = "Hot"
#  enable_blob_encryption    = true
#  enable_file_encryption    = true
#  enable_https_traffic_only = true
  // Tags
#  common_tags  = "${local.tags}"
#  team_contact = "${var.team_contact}"
#  destroy_me   = "${var.destroy_me}"

#  sa_subnets = ["${data.azurerm_subnet.ase.id}", "${data.azurerm_subnet.aks-01.id}", "${data.azurerm_subnet.aks-00.id}"]
#}

provider "azurerm" {
  alias           = "aks-infra"
  subscription_id = "${var.aks_infra_subscription_id}"
}