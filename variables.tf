variable "nat_gateway_count" { default = 1 }

variable "name" {}
variable "env_name" {}
variable "vpc_id" {}

variable "common_tags" {
  type    = map(any)
  default = {}
}
variable "extra_tags" {
  type    = map(any)
  default = {}
}

variable "subnet_name" {
  type    = string
  default = "public"
  validation {
    condition = contains(["public", "Public"], var.subnet_name)
    error_message = "NAT Gateway must be deployed to a Public Subnet"
  }
}