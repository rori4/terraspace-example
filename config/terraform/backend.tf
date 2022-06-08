terraform {
  backend "s3" {
    bucket         = "<%= expansion('terraspace-testing') %>"
    key            = "<%= expansion(':REGION/:ENV/:mod_name/terraform.tfstate') %>"
    region         = "<%= expansion(':REGION') %>"
    encrypt        = false
    # dynamodb_table = "terraform_locks"
  }
}
