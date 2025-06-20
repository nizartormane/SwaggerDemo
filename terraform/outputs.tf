output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "Public subnet ID"
  value       = aws_subnet.public.id
}

output "internet_gateway_id" {
  description = "Internet gateway ID"
  value       = aws_internet_gateway.gw.id
}

output "route_table_id" {
  description = "Route table ID"
  value       = aws_route_table.rt.id
}

output "security_group_id" {
  description = "Security group ID"
  value       = aws_security_group.web_sg.id
}

output "instance_id" {
  description = "Instance ID"
  value       = aws_instance.web.id
}

output "instance_public_ip" {
  description = "Public IP of the instance"
  value       = aws_instance.web.public_ip
}
