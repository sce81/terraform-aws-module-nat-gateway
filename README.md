# Terraform Module for AWS NAT Gateway
### All code is provided for reference purposes only and is used entirely at own risk. Code is for use in development environments only. Not intended for Production use.

## Getting Started

This module is intended to create NAT Gateways

Resources
- aws_nat_gateway[nat_gateway_count]
- aws_eip[nat_gateway_count]


### Prerequisites

Terraform ~> 1.40

### Tested

Terraform ~> 1.14.5
### Installing

This module should be called by a terraform environment configuration
```  
    source  =   "git@github.com:sce81/terraform-aws-module-nat-gateway.git"
```

### Usage

This module has a number of mandatory variables it expects to be passed into it.  

```
env_name
vpc_id
````

addional tags can be appended using the following map

```
extra_tags
```

the remaining variables are configured with sane defaults which can be overwritten by the parent.  


### Outputs

The following values are outputted

- aws_nat_gateway.main[*].id
- aws_nat_gateway.main[*].private_ip
- aws_nat_gateway.main[*].public_ip

