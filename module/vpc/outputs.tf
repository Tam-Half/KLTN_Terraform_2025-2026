output "vpc_id" {
    value = aws_vpc.main.id
    description = "vpc id"
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = aws_subnet.public_1a.id
}