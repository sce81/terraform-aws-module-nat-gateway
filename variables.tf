variable "nat_gateway_count" { default = 3 }

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