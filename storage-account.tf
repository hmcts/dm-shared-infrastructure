resource "azurerm_storage_account" "storage" {
  name = "${var.product}store${var.env}"
  resource_group_name = "${azurerm_resource_group.shared_rg.name}"
  location = "${var.location}"
  account_tier = "Standard"
  account_replication_type = "LRS"
  account_kind = "StorageV2"
  access_tier = "Hot"
  enable_blob_encryption    = true
  enable_file_encryption    = true
  enable_https_traffic_only = true

  tags {
    environment = "${var.env}"
  }
}

output "storageAccountName" {
  value = "${azurerm_storage_account.storage.name}"
}
