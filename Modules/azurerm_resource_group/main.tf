bhai rk kahaninlikh mast wali 
dhoom ka pagal

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.rg_location
  tags     = var.rg_tags
}

resource "azurerm_resource_group" "rg2" {
  name     = var.rg_name
  location = var.rg_location
  tags     = var.rg_tags
}

