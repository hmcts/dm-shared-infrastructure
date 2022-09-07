locals {
  tags = "${merge(
    var.common_tags,
    map(
      "Team Contact", var.team_contact,
      "Destroy Me", var.destroy_me
    )
  )}"

  arm_aks_subnets = ["${data.azurerm_subnet.ase.id}", "${data.azurerm_subnet.aks-01.id}", "${data.azurerm_subnet.aks-00.id}"]
  cft_aks_subnets = var.env == "prod" ? ["${data.azurerm_subnet.cft-aks-00.id}", "${data.azurerm_subnet.cft-aks-01.id}"] : []
}

resource "azurerm_resource_group" "shared_rg" {
  name     = "${var.product}-shared-${var.env}"
  location = "${var.location}"

  tags = "${local.tags}"
}

provider "azurerm" {
    features {}
}
