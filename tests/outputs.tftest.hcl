
# WARNING: Generated module tests should be considered experimental and be reviewed by the module author.

run "output_validation" {
  variables {
    name              = "test"
    env_name          = "test-env"
    nat_gateway_count = 1
  }

  assert {
    condition     = length(output.id) == 1
    error_message = "There should be 1 NAT gateway ID"
  }

  assert {
    condition     = length(output.private_ip) == 1
    error_message = "There should be 1 private IP"
  }

  assert {
    condition     = length(output.public_ip) == 1
    error_message = "There should be 1 public IP"
  }
}