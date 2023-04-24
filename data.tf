data "aws_vpc" "selected" {
  id = var.vpc_id
}
data "aws_subnet_ids" "selected" {
  vpc_id = var.vpc_id

    tags = {
    Name = "*-public-*"
  }
}

data "aws_subnet" "selected" {
  for_each = data.aws_subnet_ids.selected.ids
  id       = each.value
}

locals {

    subnet_ids  = tolist(data.aws_subnet_ids.selected.ids)
    
  common_tags = tomap({
    Terraform   = "true"
  })


}
