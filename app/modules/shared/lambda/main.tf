# This is where you put your resource declaration

# resource "aws_s3_bucket" "lambda_bucket" {
#   bucket = var.bucket_name
# }

# resource "aws_s3_object" "lambda_hello_world" {
#   bucket = aws_s3_bucket.lambda_bucket.id
#   key    = var.s3_object_key
#   source = var.s3_object_source
#   etag = filemd5(var.s3_object_source)
# }

resource "aws_lambda_function" "test_lambda" {
  # If the file is not in the current working directory you will need to include a 
  # path.module in the filename.
  filename      = var.s3_object_source
  function_name = var.lambda_function_name
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = var.handler_name

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
  source_code_hash = filebase64sha256(var.s3_object_source)

  runtime = var.lambda_runtime

  environment {
    variables = {
      foo = "bar"
    }
  }
}

resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}
