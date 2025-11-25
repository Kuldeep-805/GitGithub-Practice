resource "azurerm_storage_account" "storage_account" {
  name                     = var.sa_name
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  # Required for CMK
  identity {
    type = "SystemAssigned"
  }

  # CMK Encryption (THIS FIXES CKV2_AZURE_1)
  encryption {
    key_source = "Microsoft.Keyvault"
    key_vault_key_id = azurerm_key_vault_key.cmk.id

    services {
      blob {
        enabled = true
      }
      file {
        enabled = true
      }
    }
  }

  tags = var.tags
}
