# This is where you put your variables declaration
# variable "bucket_name" {
#   type = string
#   description = "Bucket name"
# }


# variable "s3_object_key" {
#   type = string
#   description = "S3 Object key"
# }

variable "s3_object_source" {
  type = string
  description = "S3 Object source"
}


variable "lambda_function_name" {
  type = string
  description = "lambda function name"
}

variable "handler_name" {
  type = string
  description = "Handler name"
}

variable "lambda_runtime" {
  type = string
  description = "Lambda runtime"
}
