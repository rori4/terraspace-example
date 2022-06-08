# Docs: https://www.terraform.io/docs/providers/aws/index.html
#
# If AWS_PROFILE and AWS_REGION is set, then the provider is optional.  Here's an example anyway:
#
# provider "aws" {
#   region = "us-east-1"
# }

terraform {
  # Pin the version of Terraform used to 1.0.3
  required_version = "1.0.3"

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    mongodbatlas = {
      source = "mongodb/mongodbatlas"
    }
    random = {
      source = "hashicorp/random"
    }
  }
}

provider "aws" {
  region = "eu-west-1" # Ireland AWS Region
  default_tags {
    tags = local.tags
  }
}
