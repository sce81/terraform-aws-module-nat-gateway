resource "aws_nat_gateway" "main" {
  // 1 per vpc for costs, 1 per az for resilience
  count         = var.nat_gateway_count
  allocation_id = element(aws_eip.main[*].id, count.index)
  subnet_id     = element(local.subnet_ids, count.index)

  tags = merge(
    local.common_tags, var.extra_tags,
    tomap({
      Name = "${var.name}-${var.env_name}-natgw${count.index + 1}-hello-agent"
    })
  )

}

resource "aws_eip" "main" {
  count = var.nat_gateway_count
  domain = "vpc"

  tags = merge(
    local.common_tags, var.extra_tags,
    tomap({
      Name = "${var.name}-${var.env_name}-natgw${count.index + 1}-eip"
    })
  )
    depends_on = [ aws_nat_gateway.main ]
} 