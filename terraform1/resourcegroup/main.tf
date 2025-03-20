resource "azurerm_resource_group" "example" {
    name = "demo-rg-${var.env}"
    location = var.location 
    tags = {
        environment = var.env
    }
}