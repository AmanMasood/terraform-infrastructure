# Dev: smallest footprint, single AZ, no NAT.
region             = "eu-central-1"
vpc_cidr           = "10.10.0.0/16"
az_count           = 1
enable_nat_gateway = false
instance_count     = 1
instance_type      = "t3.micro"
ssh_allowed_cidrs  = []
