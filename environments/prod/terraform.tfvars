# Prod: two AZs, two instances, NAT for private subnets.
region             = "eu-central-1"
vpc_cidr           = "10.20.0.0/16"
az_count           = 2
enable_nat_gateway = true
instance_count     = 2
instance_type      = "t3.small"
ssh_allowed_cidrs  = []
