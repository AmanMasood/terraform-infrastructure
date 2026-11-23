variable "name" {
  description = "Name prefix"
  type        = string
}

variable "instance_count" {
  description = "Number of web instances"
  type        = number
  default     = 1
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "subnet_ids" {
  description = "Subnets to spread instances across"
  type        = list(string)
}

variable "security_group_ids" {
  description = "Security groups attached to the instances"
  type        = list(string)
}

variable "key_name" {
  description = "Existing EC2 key pair name (null for none)"
  type        = string
  default     = null
}

variable "root_volume_gb" {
  description = "Root volume size in GB"
  type        = number
  default     = 10
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default     = {}
}
