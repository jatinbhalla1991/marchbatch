provider "azurerm" {
    features {}

subscription_id = "9112ff5f-1a9e-411d-b35f-4ec8bd46878a"
}

# terraform {
#   backend "azurerm" {
#     resource_group_name   = "my-resource-group"  # The resource group containing the storage account
#     storage_account_name  = "mytfstateaccount"   # The name of the storage account
#     container_name        = "terraform-state"    # The name of the container to store the state file
#     key                    = "terraform.tfstate" # The name of the state file
#   }
# }
