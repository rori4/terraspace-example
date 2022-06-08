variable "acl" {
  description = "The canned ACL to apply. Defaults to 'private'."
  type        = string
  default     = "private"
}


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
