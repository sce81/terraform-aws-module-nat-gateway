
# WARNING: Generated module tests should be considered experimental and be reviewed by the module author.

run "variables_validation" {
  variables {
    name              = "test"
    env_name          = "test-env"
    nat_gateway_count = 1
    common_tags       = { "Common" = "Tag" }
    extra_tags        = { "Extra" = "Tag" }
    subnet_name       = "public"
  }

  assert {
    condition     = var.name == "test"
    error_message = "Name variable should be 'test'"
  }

  assert {
    condition     = var.env_name == "test-env"
    error_message = "Environment name variable should be 'test-env'"
  }

  assert {
    condition     = var.nat_gateway_count == 1
    error_message = "NAT gateway count variable should be 1"
  }

  assert {
    condition     = var.common_tags["Common"] == "Tag"
    error_message = "Common tag 'Common' should be 'Tag'"
  }

  assert {
    condition     = var.extra_tags["Extra"] == "Tag"
    error_message = "Extra tag 'Extra' should be 'Tag'"
  }

  assert {
    condition     = var.subnet_name == "public"
    error_message = "Subnet name variable should be 'public'"
  }
}