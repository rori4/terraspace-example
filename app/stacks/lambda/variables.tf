# This is where you put your variables declaration
variable "environment" {
  description = "The environemnt"
  type        = string
  default     = "ropsten"
}


variable "namespace" {
  description = "The namespace"
  type        = string
  default     = "euler"
}
