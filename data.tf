data "aws_vpc" "main" {
  filter {
    name   = "tag:Name"
    values = ["${var.name}-${var.env_name}-vpc"]
  }
}

data "aws_subnets" "main" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.main.id]
  }

  filter {
    name   = "tag:Name"
    values = ["*-${var.subnet_name}-az*"]
  }
}

locals {

  subnet_ids = tolist(data.aws_subnets.main.ids)

  common_tags = tomap({
    Terraform = "true"
  })


}
