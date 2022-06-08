# This is where you put your resource declaration
data "archive_file" "lambda_hello_world" {
  type = "zip"
  source_dir  = "./scripts/hello-world"
  output_path = "./packages/hello-world.zip"
}

locals {
  resource_prefix = "${var.namespace}-${var.environment}"
  bucket_name = "${local.resource_prefix}-terraform-test"
  s3_object_key = "hello-world.zip"
  handler_name = "hello.handler"
  s3_object_source = data.archive_file.lambda_hello_world.output_path
  lambda_function_name = "${local.resource_prefix}-test-lambda"
  lambda_runtime = "nodejs16.x"
  tags = {
    Environment = var.environment
    Namespace   = var.namespace
    Terraform   = "Yes"
  }
}

module "hello-world-lambda" {
  source = "../../modules/shared/lambda"
  # bucket_name = local.bucket_name
  # s3_object_key = local.s3_object_key
  s3_object_source = local.s3_object_source
  lambda_function_name = local.lambda_function_name
  handler_name = local.handler_name
  lambda_runtime = local.lambda_runtime
}
