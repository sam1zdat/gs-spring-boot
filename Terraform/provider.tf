terraform {
    # Terraform CLI version
    required_version= ">=0.13.4"
    backend {
        }
}

provider "azurerm"{
    version= "=2.0"
    features {}
}
