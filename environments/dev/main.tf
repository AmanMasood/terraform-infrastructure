terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.60"
    }
  }

  # Remote state with locking. Create the bucket/table once with ../../bootstrap,
  # then run: terraform init -backend-config=backend.hcl
  backend "s3" {}
}

provider "aws" {
  region = var.region

  default_tags {
    tags = local.tags
  }
}

locals {
  name = "${var.project}-dev"
  tags = {
    Project     = var.project
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}

module "vpc" {
  source             = "../../modules/vpc"
  name               = local.name
  cidr_block         = var.vpc_cidr
  az_count           = var.az_count
  enable_nat_gateway = var.enable_nat_gateway
  tags               = local.tags
}

module "security" {
  source            = "../../modules/security"
  name              = local.name
  vpc_id            = module.vpc.vpc_id
  ssh_allowed_cidrs = var.ssh_allowed_cidrs
  tags              = local.tags
}

module "compute" {
  source             = "../../modules/compute"
  name               = local.name
  instance_count     = var.instance_count
  instance_type      = var.instance_type
  subnet_ids         = module.vpc.public_subnet_ids
  security_group_ids = [module.security.web_sg_id]
  key_name           = var.key_name
  tags               = local.tags
}
