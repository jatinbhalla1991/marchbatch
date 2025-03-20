
module "resourcegroup" {
  source  = "../terraform/resourcegroup"
  env     = var.env
  location = var.location
}


module "virtualmachine" {
  source  = "../terraform/virtualmachine"
  vnet_name     = var.vnet_name
  location = var.location
  env =var.env
}
