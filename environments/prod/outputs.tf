output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = module.vpc.public_subnet_ids
}

output "web_public_ips" {
  description = "Public IPs of the web servers"
  value       = module.compute.public_ips
}

output "web_urls" {
  description = "HTTP URLs of the web servers"
  value       = [for ip in module.compute.public_ips : "http://${ip}"]
}
