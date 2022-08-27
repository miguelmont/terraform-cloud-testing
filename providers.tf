terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.19.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "3f44e608-3eb8-4d7d-a854-8760b2962882" #ID de la suscripcion
  tenant_id       = "f49dd88c-71ef-4be3-af0a-a3b350abe532" #ID del directorio
  client_id       = "868394a5-9d78-4533-aeae-f4e5eeec286d" #ID de la app registrada
  client_secret   = "Z5u8Q~~tWmJNy7v.HqTDx0HCrD8aRp2Hj42KOcJu"
  features {}
}