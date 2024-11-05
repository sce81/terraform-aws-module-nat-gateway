
# WARNING: Generated module tests should be considered experimental and be reviewed by the module author.

run "resource_validation" {
  variables {
    name              = "test"
    env_name          = "test-env"
    nat_gateway_count = 1
    extra_tags        = { "Extra" = "Tag" }
  }

  assert {
    condition     = length(aws_nat_gateway.main) == 1
    error_message = "There should be 1 NAT gateway"
  }

  assert {
    condition     = length(aws_eip.main) == 1
    error_message = "There should be 1 EIP"
  }

  assert {
    condition     = aws_nat_gateway.main[0].tags["Name"] == "test-test-env-natgw1"
    error_message = "NAT gateway name tag is incorrect"
  }

  assert {
    condition     = aws_eip.main[0].tags["Name"] == "test-test-env-natgw1-eip"
    error_message = "EIP name tag is incorrect"
  }
}