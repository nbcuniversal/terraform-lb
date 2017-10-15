variable "internal_loadbalancer" {
  default = false
}

variable "enable_deletion_protection" {
  default = true
}

variable "subnet_ids" {}

variable "budget" {}

variable "environment" {}

variable "access_logs_bucket" {}

variable "access_logs_enabled" {
  default = true
}

variable "vpc_id" {}

variable "lifecycle_create_before_destroy" {
  default = true
}

variable "ingress_allowed_cidr_blocks" {
  default = "0.0.0.0/0"
}
