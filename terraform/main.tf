# https://registri.terraform.io/providers/hashicorp/azurerm/latest/docs
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.1"
    }
  }
}

# provider para autenticacion
provider "azurerm" {
  features {}
  subscription_id = "07239b14-e164-471b-8670-bef9b897d813"
  client_id       = "2774f7c1-9388-49ea-8b91-d277543762c4"
  client_secret   = "kt18Q~an8uZssK78F11mrCoZWHP3js5LsyX96c5y"
  tenant_id       = "2249b7c7-177b-4fec-b560-2bf92e748e17"
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group
resource "azurerm_resource_group" "rg" {
  name     = "kubernetes_rg_cp2"
  location = var.location

  tags = {
    environment = "CP2"
  }
}

# Storage account
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account
resource "azurerm_storage_account" "stAccount" {
  name                     = "staccountaezumcp2"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "CP2"
  }
}
