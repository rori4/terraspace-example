locals {
  tags = {
    Environment = var.environment
    Namespace   = var.namespace
    Terraform   = "Yes"
  }
}

resource "random_pet" "this" {
  length = 2
}

module "bucket" {
  source = "../../modules/example"
  bucket = "bucket-${random_pet.this.id}"
  acl    = var.acl
}
