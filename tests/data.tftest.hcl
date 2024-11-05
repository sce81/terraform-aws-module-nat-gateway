
# WARNING: Generated module tests should be considered experimental and be reviewed by the module author.

run "data_validation" {
  variables {
    name        = "test"
    env_name    = "test-env"
    subnet_name = "public"
  }

  assert {
    condition     = data.aws_vpc.main.id != null
    error_message = "VPC ID should not be null"
  }

  assert {
    condition     = length(data.aws_subnets.main.ids) > 0
    error_message = "Subnets should not be empty"
  }

  assert {
    condition     = length(local.subnet_ids) > 0
    error_message = "Local subnet IDs should not be empty"
  }

  assert {
    condition     = local.common_tags["Terraform"] == "true"
    error_message = "Common tag 'Terraform' should be 'true'"
  }
}