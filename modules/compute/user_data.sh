#!/bin/bash
# Minimal web server bootstrap so the instance is useful immediately.
set -euxo pipefail
apt-get update -y
apt-get install -y nginx
TOKEN=$(curl -sX PUT http://169.254.169.254/latest/api/token -H "X-aws-ec2-metadata-token-ttl-seconds: 60")
IID=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/instance-id)
AZ=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/placement/availability-zone)
echo "<h1>Provisioned by Terraform</h1><p>Instance $IID in $AZ</p>" > /var/www/html/index.html
systemctl enable --now nginx
