variable "region" {
  description = "AWS region"
  type        = string
}

variable "project" {
  description = "Project name used in resource names and tags"
  type        = string
  default     = "devops-portfolio"
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
}

variable "az_count" {
  description = "Number of AZs"
  type        = number
}

variable "enable_nat_gateway" {
  description = "Create a NAT gateway"
  type        = bool
  default     = false
}

variable "ssh_allowed_cidrs" {
  description = "CIDRs allowed to SSH"
  type        = list(string)
  default     = []
}

variable "instance_count" {
  description = "Web instance count"
  type        = number
}

variable "instance_type" {
  description = "Web instance type"
  type        = string
}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
  default     = null
}
